import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_native_mirror/feature/native/domain/interfaces/interfaces.nativechannels.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/environment/environment.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/services/services.nativechannels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import '../native/fixtures/native_channels.fixture.dart';

class Helpers {
  static const String _tag = 'Helpers';

  static const uuid = Uuid();

  late MethodChannel platformMainMethodChannel;

  late MethodChannel entrypointMethodChannel;

  late EventChannel entrypointEventChannel;

  late IDevicePlatform devicePlatform;

  late MockPlatformChannels mockPlatformChannels;

  late CallBacksController callBacksController;

  /// avoid channel replacing between instance requests
  bool resetChannels = false;

  void setUpEntrypointChannels(String id) {
    entrypointMethodChannel = MethodChannel(
        '${NativeCommunicationMetadata.platformMethodChannel}.$id');
    entrypointEventChannel =
        EventChannel('${NativeCommunicationMetadata.hostEventChannel}.$id');
  }

  /// Intercept and overrides some properties do mock them.
  /// [entrypointMethodChannel] and [entrypointEventChannel]
  IPlatformEntrypoint instanceFactory({
    required String id,
    required String mainChannelId,
    required MethodChannel methodChannel,
    required EventChannel eventChannel,
    required CallBacksController callBacksController,
  }) {
    log('instanceFactory($id)');
    setUpEntrypointChannels(id);
    return PlatformEntrypoint(
      id: id,
      mainChannelId: mainChannelId,
      methodChannel: entrypointMethodChannel,
      eventChannel: entrypointEventChannel,
      callBacksController: callBacksController,
    );
  }

  void setupChannels(String id, WidgetTester tester) {
    log('setupChannels($id): resetChannels: $resetChannels');
    try {
      // arranje

      if (resetChannels == false) {
        return;
      }

      // Platform

      platformMainMethodChannel = MethodChannel(
        NativeCommunicationMetadata.scheme,
      );
      // platformMainMethodChannel.setMockMethodCallHandler(
      //   mockPlatformChannels.onMethodCall,
      // );
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        platformMainMethodChannel,
        mockPlatformChannels.onMethodCall,
      );

      // Entrypoint
      entrypointMethodChannel = MethodChannel(
          '${NativeCommunicationMetadata.platformMethodChannel}.$id');
      // entrypointMethodChannel.setMockMethodCallHandler(
      //   mockPlatformChannels.onMethodCall,
      // );
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        entrypointMethodChannel,
        mockPlatformChannels.onMethodCall,
      );

      entrypointEventChannel =
          EventChannel('${NativeCommunicationMetadata.hostEventChannel}.$id');

      devicePlatform = DevicePlatform(channel: platformMainMethodChannel);

      resetChannels = false;
    } on Exception catch (e, s) {
      log('setupChannels: $e', name: _tag, stackTrace: s, error: e);
      rethrow;
    }
  }

  Future<IPlatformEntrypoint> generateEntrypoint({
    required WidgetTester tester,
    required String id,
  }) async {
    log('generateEntrypoint($id)');
    try {
      // arranje

      setupChannels(id, tester);

      // act

      return await devicePlatform.init(
        request: InitRequest(id: id),
        controller: CallBacksController(),
        instanceFactory: instanceFactory,
      );
    } catch (e, s) {
      log('generateEntrypoint($id):', name: _tag, stackTrace: s, error: e);
      rethrow;
    }
  }

  /// [EventChannel.receiveBroadcastStream]
  /// Creates a method channel, with same himself name,
  /// and invokes [listen] method.
  /// At this moment, we can queue a message using [handlePlatformMessage]
  /// from our [EventChannel]'s instance.
  void sendEventThroughEntrypointsEventChannel({
    required INativeModel expectedValue,
  }) {
    final playbackEventChannel = MethodChannel(entrypointEventChannel.name);

    playbackEventChannel.setMockMethodCallHandler((
      MethodCall methodCall,
    ) async {
      log('MethodChannel playbackEventChannel setMockMethodCallHandler:\n '
          'methodCall: ${methodCall.method}');

      if (methodCall.method == 'listen') {
        /// Queues a message.
        entrypointEventChannel.binaryMessenger.handlePlatformMessage(
          entrypointEventChannel.name,
          const StandardMethodCodec().encodeSuccessEnvelope(
            expectedValue.toMap(),
          ),
          (_) {},
        );
      }
    });
  }

  Future<String> platformSetUp({
    required WidgetTester tester,
  }) async {
    final id = uuid.v4();

    mockPlatformChannels.setExpectedBehavior(
      response: InitResponse(id: id),
    );

    // act

    final entrypoint = await generateEntrypoint(
      tester: tester,
      id: id,
    );

    // assert

    expect(entrypoint.id, id);

    expect(devicePlatform.entrypoints.containsKey(id), true);

    expect(devicePlatform.entrypoints.length, 1);

    // exit

    return id;
  }
}
