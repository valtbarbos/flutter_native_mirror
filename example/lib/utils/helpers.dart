import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_native_mirror/feature/native/domain/interfaces/interfaces.nativechannels.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/generated/google/protobuf/any.pb.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/generated/proto/message.pb.dart';
import 'package:flutter_native_mirror/feature/native/environment/environment.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/services/services.nativechannels.dart';
import 'package:uuid/uuid.dart';

class NativeChannelsCommunication {
  Uuid uuid = const Uuid();

  String platformVersion = "unknow";

  String? nativeInstanceId;

  late IDevicePlatform devicePlatform;

  late IPlatformEntrypoint entrypoint;

  late Map<String, bool> lastInstances;

  /// Gives us the opportunitty to intercept and overrides some properties.
  IPlatformEntrypoint instanceFactory({
    required String id,
    required String mainChannelId,
    required EventChannel eventChannel,
    required MethodChannel methodChannel,
    required CallBacksController callBacksController,
  }) {
    return PlatformEntrypoint(
      id: id,
      mainChannelId: mainChannelId,
      methodChannel: methodChannel,
      eventChannel: eventChannel,
      callBacksController: callBacksController,
    );
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      nativeInstanceId = uuid.v4();

      devicePlatform = DevicePlatform(
        channel: MethodChannel(
          NativeCommunicationMetadata.platformMethodChannel,
        ),
      );

      entrypoint = await devicePlatform.init(
        request: InitRequest(
          id: nativeInstanceId!,
        ),
        instanceFactory: instanceFactory,
        controller: CallBacksController(),
      );

      nativeInstanceId = entrypoint.id;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
  }

  Future<void> requestWithProtobuf() async {
    final requestMessage = Message(
        header: Header(
          id: entrypoint.id,
          namespace: NativeCommunicationMetadata.businessNamespace,
          targetMethod: 'simpleRpc',
        ),
        payload: Payload(
            valuebytes: Any.pack(Generic(data: DateTime.now().toString()))));

    final responseMessage = await entrypoint.send(requestMessage);

    final packet1 = Generic.create();

    requestMessage.payload.valuebytes.unpackInto(packet1);

    final sentTime = DateTime.parse(packet1.data);

    final packet2 = Generic.create();

    responseMessage.payload.valuebytes.unpackInto(packet2);

    final receivedTime = DateTime.parse(packet2.data);

    if (receivedTime.second > sentTime.second) {
      platformVersion = 'nativeInstanceId:\n'
          '$nativeInstanceId\n'
          'haha!\n'
          'sent: $sentTime\n'
          'received: $receivedTime *(from the "future"! hahah)';
      log(platformVersion);
    }
  }

  Future<String> testAvailableMethods() async {
    lastInstances.putIfAbsent(entrypoint.id, () => true);

    _listeningToHostEvents(entrypoint.eventMessageStream);

    await requestWithProtobuf();

    return platformVersion;
  }

  Stream<EventMessage>? _previousStream;
  StreamSubscription? _streamSubscription;

  void _listeningToHostEvents(Stream<EventMessage> received) {
    if (received != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = received;
      _streamSubscription = _previousStream!.listen((event) {
        log('FlutterNativeMirror -> event: ${event.value}');
      });
    }
  }

  void disposePlatformState() {
    if (nativeInstanceId == null) {
      return;
    }

    try {
      final disposeRequest = DisposeRequest(
        id: nativeInstanceId!,
      );

      devicePlatform.dispose(
        disposeRequest,
      );

      if (lastInstances.isNotEmpty &&
          lastInstances.containsKey(disposeRequest.id)) {
        lastInstances.update(disposeRequest.id, (value) => false);
      }

      platformVersion = 'Disposed.';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    log(platformVersion);
  }
}
