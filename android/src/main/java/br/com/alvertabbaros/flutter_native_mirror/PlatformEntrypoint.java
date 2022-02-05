package br.com.alvertabbaros.flutter_native_mirror;

import android.app.Application;

import br.com.alvertabbaros.flutter_native_mirror.handlers.BetterEventChannel;
import br.com.alvertabbaros.flutter_native_mirror.handlers.EntrypointHandler;
import br.com.alvertabbaros.flutter_native_mirror.helpers.CommunicationMetadata;

import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class PlatformEntrypoint {

    private final String TAG = CommunicationMetadata.TAG;

    private String instanceId;

    private EntrypointHandler methodCallHandler;

    private final MethodChannel methodChannel;

    private Application application;

    public PlatformEntrypoint(
        BinaryMessenger messenger,
        String id,
        Application application) {

        this.application = application;

        if (instanceId == null) {
            instanceId = id;
        }

        BetterEventChannel eventChannel = new BetterEventChannel(
                messenger,
                CommunicationMetadata.hostEventChannel + "." + instanceId);

        methodChannel = new MethodChannel(
            messenger, 
            CommunicationMetadata.platformMethodChannel + "." + instanceId);

        methodCallHandler = new EntrypointHandler(
                methodChannel,
                eventChannel,
                application);

        methodChannel.setMethodCallHandler(methodCallHandler);

        Log.i(TAG, "FlutterNativeMirrorInstance: Constructor: " + instanceId);
    }

    public void dispose() {
        Log.i(TAG, "dispose(): " + instanceId);
        instanceId = "";
        methodCallHandler.dispose();
        methodCallHandler = null;
        methodChannel.setMethodCallHandler(null);
    }
}
