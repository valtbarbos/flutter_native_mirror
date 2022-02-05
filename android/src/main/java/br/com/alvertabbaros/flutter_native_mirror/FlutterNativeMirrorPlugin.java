package br.com.alvertabbaros.flutter_native_mirror;

import android.annotation.SuppressLint;
import android.app.Application;
import android.util.Log;

import androidx.annotation.NonNull;

import br.com.alvertabbaros.flutter_native_mirror.handlers.PlatformHandler;
import br.com.alvertabbaros.flutter_native_mirror.helpers.CommunicationMetadata;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class FlutterNativeMirrorPlugin implements FlutterPlugin {

  private MethodChannel methodChannel;

  private PlatformHandler methodCallHandler;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    BinaryMessenger messenger = flutterPluginBinding.getBinaryMessenger();

    Application application = (Application) flutterPluginBinding.getApplicationContext();

    methodChannel = new MethodChannel(messenger, CommunicationMetadata.platformMethodChannel);
    methodCallHandler = new PlatformHandler(messenger, application);
    methodChannel.setMethodCallHandler(methodCallHandler);
  }

  @SuppressLint("LongLogTag")
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    String TAG = "FlutterNativeMirrorPlugin";
    Log.i(TAG, "onDetachedFromEngine: methodCallHandler.dispose()");
    methodCallHandler.dispose();
    methodCallHandler = null;
    methodChannel.setMethodCallHandler(null);
  }
}