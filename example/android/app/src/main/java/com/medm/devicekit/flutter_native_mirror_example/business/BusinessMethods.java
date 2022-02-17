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
        int currentListenerId = message.getHeader().getCallBackId();

        // Prepare a timer like self calling task
        handler = new Handler();

        Pair<Protos.Message, Runnable> callbackMethod = Pair.create(message, new Runnable() {
            @Override
            public void run() {
                if (!callbacksReferences.containsKey(currentListenerId)) {
                    handler.removeCallbacks(this);
                    return;
                }

                Protos.MirrorMethodCall.Builder mirrorMethodCall = Protos.MirrorMethodCall.newBuilder();
                Protos.Generic.Builder generic = Protos.Generic.newBuilder();

                Protos.Payload.Builder payload = Protos.Payload.newBuilder();
                Protos.Result.Builder result = Protos.Result.newBuilder();

                result.setValue("From host's side: Hello listener!\n"+ (System.currentTimeMillis() / 1000));

                mirrorMethodCall.setMethod("playgroundStart");
                generic.setData(result.getValue());
                mirrorMethodCall.setArguments(Any.pack(generic.build()));

                payload.setResult(result);

                invokePlatformMethod(
                        payload.build(),
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

        Protos.Payload.Builder payload = Protos.Payload.newBuilder();

        response.setHeader(message.getHeader());

        Protos.Result.Builder result = Protos.Result.newBuilder();

        payload.setResult(result);

        Protos.Message sent = invokePlatformMethod(
                payload.build(),
                Protos.Header.CommunicationType.CANCELATION,
                mirrorMethodCall.build(),
                message);

        callbacksReferences.remove(message.getHeader().getCallBackId());

        platformResult.success(sent.toByteArray());
    }

    void simpleRpc(
            Protos.Message message,
            MethodChannel.Result platformResult) {

        // response object

        Protos.Message.Builder response = Protos.Message.newBuilder();

        Protos.Header.Builder header = Protos.Header.newBuilder();

        Protos.Payload.Builder payload = Protos.Payload.newBuilder();

        // to each other

        header.setId(message.getHeader().getId());
        header.setnamespace(message.getHeader().getnamespace());
        header.settargetMethod(message.getHeader().gettargetMethod());

        // just an improvement

        Instant time;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            time = Instant.now();

            time = time.plusSeconds(10);

            Timestamp timestamp = Timestamp
                    .newBuilder()
                    .setSeconds(time.getEpochSecond())
                    .setNanos(time.getNano()).build();

            header.setLastUpdated(timestamp);
        }

        // set all response properties

        response.setHeader(header);

        Protos.Result.Builder result = Protos.Result.newBuilder();

        payload.setResult(result);

        platformResult.success(response.build().toByteArray());
    }

    private Protos.Message invokePlatformMethod(
            Protos.Payload payload,
            Protos.Header.CommunicationType communicationType,
            Protos.MirrorMethodCall mirrorMethodCall,
            @NonNull Protos.Message messageBase
            ) {
        // Serialize a new response Message

        Protos.Header baseHeader = messageBase.getHeader();
        Protos.Message.Builder pMessage = Protos.Message.newBuilder();
        Protos.Header.Builder pHeader = Protos.Header.newBuilder();

        pHeader.setId(baseHeader.getId());
        pHeader.setCallBackId(baseHeader.getCallBackId());
        pHeader.setnamespace(baseHeader.getnamespace());
        pHeader.settargetMethod(baseHeader.gettargetMethod());
        pHeader.settargetMethodBytes(baseHeader.gettargetMethodBytes());

        Instant time;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            time = Instant.now();

            time = time.plusSeconds(10);

            Timestamp timestamp = Timestamp
                    .newBuilder()
                    .setSeconds(time.getEpochSecond())
                    .setNanos(time.getNano()).build();

            pHeader.setLastUpdated(timestamp);
        }

        String callBackMethodHandler = messageBase.getHeader().getCallBackMethodHandler();

        pHeader.setCommunicationType(communicationType);

        pMessage.setHeader(pHeader.build());

        pMessage.setPayload(payload);

        pMessage.setMethodCall(mirrorMethodCall);

        channel.invokeMethod(callBackMethodHandler, pMessage.build().toByteArray());

        return pMessage.build();
    }

    public void dispose(){
        String TAG = "BusinessMethods";
        Log.i(TAG, "dispose: ");
    }
}
