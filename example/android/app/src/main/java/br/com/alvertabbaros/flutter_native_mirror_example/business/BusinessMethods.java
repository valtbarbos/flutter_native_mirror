package br.com.alvertabbaros.flutter_native_mirror_example.business;

import android.app.Application;
import android.os.Handler;
import android.util.Log;
import android.util.Pair;

import androidx.annotation.NonNull;

import com.google.protobuf.Any;
import com.google.protobuf.Timestamp;
import br.com.alvertabbaros.flutter_native_mirror.protos.Protos;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.MethodChannel;

public class BusinessMethods {

    private Handler handler;

    private final Map<Integer, Pair<Protos.Message, Runnable>> callbacksReferences = new HashMap<>();

    private MethodChannel channel;

    private Application application;

    public BusinessMethods() { }

    public BusinessMethods(
            Application application,
            MethodChannel channel
    ) {
        this.application = application;
        this.channel = channel;
    }

    void playgroundStart(Protos.Message message, MethodChannel.Result platformResult) {
        // Get callback id
        int currentListenerId = message.getHeader().getCallBackReferenceId();

        // Prepare a timer like self calling task
        handler = new Handler();

        Pair<Protos.Message, Runnable> callbackMethod = Pair.create(message, new Runnable() {
            @Override
            public void run() {
                if (!callbacksReferences.containsKey(currentListenerId)) {
                    handler.removeCallbacks(this);
                    return;
                }

                Protos.Generic.Builder generic = Protos.Generic.newBuilder();

                generic.setData("From host's side: Hello listener!\n"+ (System.currentTimeMillis() / 1000));

                Protos.MirrorMethodCall.Builder mirrorMethodCall = Protos.MirrorMethodCall.newBuilder();

                mirrorMethodCall.setMethod("playgroundStart");

                mirrorMethodCall.setArguments(Any.pack(generic.build()));

                invokePlatformMethod(
                        Protos.Header.CommunicationType.SETUP,
                        mirrorMethodCall.build(),
                        message);

                handler.postDelayed(this, 1000);
            }
        });

        callbacksReferences.put(currentListenerId, callbackMethod);

        // Run task
        handler.postDelayed(Objects.requireNonNull(callbacksReferences.get(currentListenerId)).second, 1000);

        // Return immediately
        platformResult.success(null);
    }

    void playgroundStop(Protos.Message message, MethodChannel.Result platformResult) {

        Protos.MirrorMethodCall.Builder mirrorMethodCall = Protos.MirrorMethodCall.newBuilder();

        Protos.Generic.Builder generic = Protos.Generic.newBuilder();

        mirrorMethodCall.setMethod("playgroundStop");

        mirrorMethodCall.setArguments(Any.pack(generic.build()));

        Protos.Message.Builder response = Protos.Message.newBuilder();

        response.setHeader(message.getHeader());

        Protos.Message sent = invokePlatformMethod(
                Protos.Header.CommunicationType.CANCELATION,
                mirrorMethodCall.build(),
                message);

        callbacksReferences.remove(message.getHeader().getCallBackReferenceId());

        platformResult.success(sent.toByteArray());
    }

    void simpleRpc(
            Protos.Message message,
            MethodChannel.Result platformResult) {

        // response object

        Protos.Message.Builder response = Protos.Message.newBuilder();

        Protos.Header.Builder header = Protos.Header.newBuilder();

        // to each other

        header.setId(message.getHeader().getId());
        header.setNamespace(message.getHeader().getNamespace());
        header.setTargetMethod(message.getHeader().getTargetMethod());

        // just an improvement

        Protos.Generic.Builder generic = Protos.Generic.newBuilder();

        Instant time;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            time = Instant.now();
            time = time.plusSeconds(10);
            generic.setData(time.toString());
        }

        response.setHeader(header);

        Protos.Payload.Builder result = Protos.Payload.newBuilder();

        result.setValuebytes(Any.pack(generic.build()));

        response.setPayload(result);

        platformResult.success(response.build().toByteArray());
    }

    private Protos.Message invokePlatformMethod(
            Protos.Header.CommunicationType intent,
            Protos.MirrorMethodCall mirrorMethodCall,
            @NonNull Protos.Message messageBase
            ) {
        // Serialize a new response Message

        Protos.Header baseHeader = messageBase.getHeader();
        Protos.Message.Builder pMessage = Protos.Message.newBuilder();
        Protos.Header.Builder pHeader = Protos.Header.newBuilder();

        pHeader.setId(baseHeader.getId());
        pHeader.setCallBackReferenceId(baseHeader.getCallBackReferenceId());
        pHeader.setNamespace(baseHeader.getNamespace());
        pHeader.setTargetMethod(baseHeader.getTargetMethod());
        pHeader.setTargetMethodBytes(baseHeader.getTargetMethodBytes());


        pHeader.setIntent(intent);

        pMessage.setHeader(pHeader.build());

        pMessage.setMethodCall(mirrorMethodCall);

        Protos.Generic.Builder generic = Protos.Generic.newBuilder();

        Instant time;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            time = Instant.now();

            time = time.plusSeconds(10);

            Timestamp timestamp = Timestamp
                    .newBuilder()
                    .setSeconds(time.getEpochSecond())
                    .setNanos(time.getNano()).build();

            generic.setData(timestamp.toString());
        }

        Protos.Payload.Builder result = Protos.Payload.newBuilder();

        result.setValuebytes(Any.pack(generic.build()));

        pMessage.setPayload(result);

        String platformCallBackMethodHandler = messageBase.getHeader().getPlatformCallBackMethodHandler();

        channel.invokeMethod(platformCallBackMethodHandler, pMessage.build().toByteArray());

        return pMessage.build();
    }

    public void dispose(){
        String TAG = "BusinessMethods";
        Log.i(TAG, "dispose: ");
    }
}
