import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/generated/proto/message.pb.dart';
import 'package:flutter_native_mirror/feature/native/environment/environment.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/services/services.nativechannels.dart';
import 'package:flutter_native_mirror_example/utils/helpers.dart';

class MethodChannelCallbacks extends StatefulWidget {
  // ignore: unused_field
  static const String _tag = 'MethodChannelCallbacks';

  const MethodChannelCallbacks({
    Key? key,
  }) : super(key: key);

  @override
  MethodChannelCallbacksState createState() => MethodChannelCallbacksState();
}

class MethodChannelCallbacksState extends State<MethodChannelCallbacks> {
  late NativeChannelsCommunication native;

  @override
  void initState() {
    native = NativeChannelsCommunication();
    native.nativeInstanceId = null;
    native.lastInstances = <String, bool>{};
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    native.disposePlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Press button to run playground"),
              const Text("-"),
              Text(logs)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: runPlayground,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  String logs = '';

  void listResultCallbackArgs(MirrorMethodCall logString) {
    final value = Generic.create();
    logString.arguments.unpackInto(value);
    logs += value.data.toString() + "\n\n";
  }

  void runPlayground() async {
    try {
      await native.initPlatformState();
      var _ = await native.entrypoint.startListening(
          message: PlatformEntrypoint.defaultListenerSetup(
            namespace: NativeCommunicationMetadata.businessNamespace,
            targetMethod: 'playgroundStart',
            targetMethodCancellation: 'playgroundStop',
          ),
          callback: (mirrorMethodCall, error) {
            setState(() {
              listResultCallbackArgs(mirrorMethodCall);
            });
          });
    } on Exception catch (e, s) {
      log('$e', name: 'MethodChannelCallbacks', stackTrace: s, error: e);
    }
  }
}
