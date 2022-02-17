package br.com.alvertabbaros.flutter_native_mirror.handlers;

import android.app.Application;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import com.google.protobuf.InvalidProtocolBufferException;
import br.com.alvertabbaros.flutter_native_mirror.protos.Protos;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class EntrypointHandler implements MethodCallHandler {
    private final String TAG = "EntrypointHandler";

    private final BetterEventChannel eventChannel;

    private Map<String, Object> pendingHostEvent;

    private final MethodChannel channel;

    Object businessInstance;

    private Application application;

    public EntrypointHandler(
            MethodChannel channel,
            BetterEventChannel eventChannel,
            Application application) {
        this.eventChannel = eventChannel;
        this.channel = channel;
        this.application = application;
    }

    private Object newBusinessInstance(String className, Object...args) throws Exception {
        Class<?> clazz = Class.forName(className);
        if(args == null || args.length == 0) {
            return clazz.newInstance();
        }
        List<Class<?>> argTypes = new ArrayList<>();
        for(Object object : args) {
            argTypes.add(object.getClass());
        }
        Constructor<?> explicitConstructor = clazz.getConstructor(argTypes.toArray(new Class[0]));
        return explicitConstructor.newInstance(args);
    }

    // MethodChannel.Result wrapper that responds on the platform thread.
    private static class MethodResultWrapper implements Result {
        private Result methodResult;
        private Handler handler;

        MethodResultWrapper(Result result) {
            methodResult = result;
            handler = new Handler(Looper.getMainLooper());
        }

        @Override
        public void success(final Object result) {
            handler.post(
                    new Runnable() {
                        @Override
                        public void run() {
                            methodResult.success(result);
                        }
                    });
        }

        @Override
        public void error(
                final String errorCode, final String errorMessage, final Object errorDetails) {
            handler.post(
                    new Runnable() {
                        @Override
                        public void run() {
                            methodResult.error(errorCode, errorMessage, errorDetails);
                        }
                    });
        }

        @Override
        public void notImplemented() {
            handler.post(
                    new Runnable() {
                        @Override
                        public void run() {
                            methodResult.notImplemented();
                        }
                    });
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    public void onMethodCall(
            @NonNull MethodCall call,
            @NonNull MethodChannel.Result rawResult) {

        Result result = new MethodResultWrapper(rawResult);

        byte[] data;

        Protos.Message receivedMessage;

        Protos.Header receivedHeader;

        Method method;

        Protos.Message.Builder response = Protos.Message.newBuilder();

        try {
            data = call.arguments();

            try {
                receivedMessage = Protos.Message.parseFrom(data);
            } catch (InvalidProtocolBufferException e) {
                result.error("RuntimeException", e.getMessage(), e);
                return;
            }

            if (businessInstance == null){
                businessInstance = newBusinessInstance(
                        receivedMessage.getHeader().getNamespace(),
                        application,
                        channel);
            }

            switch (call.method) {
                case "rpc":

                    method = businessInstance.getClass().getDeclaredMethod(
                            receivedMessage.getHeader().getTargetMethod(),
                            Protos.Message.class,
                            Result.class
                    );

                    method.setAccessible(true);

                    method.invoke(this.businessInstance, receivedMessage, result);

                    break;
                case "callback":

                    receivedHeader = receivedMessage.getHeader();

                    Protos.Header.CommunicationType intent = receivedHeader.getIntent();

                    String intendMethodCall =
                            intent.equals(Protos.Header.CommunicationType.SETUP) ?
                                    receivedHeader.getTargetMethod() :
                                    receivedHeader.getTargetMethodCancellation();

                    String platformCallBackMethodHandler = receivedHeader.getPlatformCallBackMethodHandler();

                    Objects.requireNonNull(
                            platformCallBackMethodHandler,
                            "Please, set [platformCallBackMethodHandler] from the Dart's side.");

                    method = businessInstance.getClass().getDeclaredMethod(
                            intendMethodCall,
                            Protos.Message.class,
                            Result.class
                    );

                    // Call method if exists
                    method.setAccessible(true);

                    method.invoke(this.businessInstance, receivedMessage, result);

                    break;
                default:
                    result.notImplemented();
                    break;
            }
        } catch (Error | RuntimeException exception) {
            response.setError(mapToProtoError(exception));
            result.success(response.build().toByteArray());
        } catch (Exception e) {
            e.printStackTrace();
            result.error("Error: " + e, null, null);
        }
        finally {
            io.flutter.Log.i(TAG, "onMethodCall: finally");
        }
    }

    //! EVENT BROADCAST TESTS:

    // Broadcasts a new event immediately.
    private void broadcastImmediateHostEvent() {
        enqueueHostEvent();
        broadcastPendingHostEvent();
    }

    // Broadcast the pending playback event if it was set.
    private void broadcastPendingHostEvent() {
        if (pendingHostEvent != null) {
            eventChannel.success(pendingHostEvent);
            pendingHostEvent = null;
        }
    }

    // Set a pending playback event that should be broadcast at
    // a later time. If we're in a Flutter method call, it will
    // be broadcast just before that method call returns. If
    // we're in an asynchronous callback, it is up to the caller
    // to eventually broadcast that event via
    // broadcastPendingHostEvent.
    //
    // If this is called multiple times before
    // broadcastPendingHostEvent, only the last event is
    // broadcast.
    private void enqueueHostEvent() {
        pendingHostEvent = createHostEvent();
    }

    /// Creates an event based on the current state.
    private Map<String, Object> createHostEvent() {
        final Map<String, Object> event = new HashMap<>();
        event.put("id", "mock.android.instanceId");
        event.put("value", "event data mock");
        return event;
    }

    public static Protos.Error mapToProtoError(Throwable exception) {
        Protos.Error.Builder error = Protos.Error.newBuilder();
        error.setMessage(exception.toString());
        error.setCode(exception.getClass().getSimpleName());
        error.setDetails("Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
        return error.build();
    }

    public void dispose() {
        Log.i(TAG, "dispose: ");
        if (businessInstance == null){
            return;
        }
        try{
            Method method = businessInstance.getClass()
                .getMethod("dispose");

            method.setAccessible(true);

            method.invoke(this.businessInstance);

            businessInstance = null;
        } catch (Exception e) {
            e.printStackTrace();
            io.flutter.Log.e(TAG, "businessInstance: dispose", e);
            // TODO: event bus notification
        }
    }
}
