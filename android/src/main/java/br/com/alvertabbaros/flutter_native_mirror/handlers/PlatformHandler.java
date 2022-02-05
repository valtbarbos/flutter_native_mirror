package br.com.alvertabbaros.flutter_native_mirror.handlers;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;

import br.com.alvertabbaros.flutter_native_mirror.PlatformEntrypoint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class PlatformHandler implements MethodCallHandler {
    private final String TAG = "PlatformHandler";

    private final BinaryMessenger messenger;

    private Application application;

    // Instances
    private final Map<String, PlatformEntrypoint> entrypoints = new HashMap<>();

    public PlatformHandler(
            BinaryMessenger messenger,
            Application application) {
        this.messenger = messenger;
        this.application = application;
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

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result rawResult) {
        Result result = new MethodResultWrapper(rawResult);

        Log.i(TAG, "onMethodCall: " + call.method);
        switch (call.method) {
            case "init": {
                String id = call.argument("id");

                if (entrypoints.containsKey(id)) {
                    result.error("Platform player " + id + " already exists", null, null);
                    break;
                }

                if (entrypoints.isEmpty()){
                    entrypoints.put(id, new PlatformEntrypoint(
                            messenger,
                            id,
                            application));
                } else {
                    // Supposed to have just one, for now.
                    id = entrypoints.entrySet().iterator().next().getKey();
                }

                HashMap<String, String> resultMap = new HashMap<>();

                resultMap.put("id", id);

                result.success(resultMap);

                break;
            }
            case "dispose":
                String id = call.argument("id");

                PlatformEntrypoint player = entrypoints.get(id);

                if (player != null) {
                    player.dispose();
                    entrypoints.remove(id);
                }

                HashMap<String, Object> resultMap = new HashMap<>();

                resultMap.put("id", id);

                result.success(resultMap);

                break;
            default:
                result.notImplemented();
                break;
        }
    }

    public void dispose() {
        Log.i(TAG, "dispose: ");
        for (PlatformEntrypoint player : new ArrayList<>(entrypoints.values())) {
            player.dispose();
        }
    }
}
