part of './services.nativechannels.dart';

/// An implementation of [IDevicePlatform] that uses method channels.
class DevicePlatform implements IDevicePlatform {
  late MethodChannel _mainChannel;

  late Map<String, bool> _entrypointsHistory;

  IPlatformEntrypoint? _actualEntrypoint;

  DevicePlatform({
    required MethodChannel channel,
  }) {
    log('DevicePlatform -> constructor: ${channel.name}');
    _mainChannel = channel;
    _entrypointsHistory = <String, bool>{};
  }

  /// Instantiates a new channel on host.
  /// Parameters:
  /// [instanceFactory] - Gives us the opportunitty to intercept and overrides some properties.
  /// Throws:
  /// [ChannelInvokeException] - When there's some problem with native communication.
  @override
  Future<IPlatformEntrypoint> init({
    required InitRequest request,
    required CallBacksController controller,
    required IPlatformEntrypoint Function({
      required String id,
      required String mainChannelId,
      required MethodChannel methodChannel,
      required EventChannel eventChannel,
      required CallBacksController callBacksController,
    })
        instanceFactory,
  }) async {
    log('DevicePlatform -> init: ${request.id}');

    final initChannel = await _mainChannel.invokeMethod<dynamic>(
      'init',
      request.toMap(),
    );

    if (initChannel == null) {
      throw ChannelInvokeException();
    }

    final response = InitResponse.fromMap(initChannel);

    final id = response.id;

    _actualEntrypoint = instanceFactory(
      id: id,
      mainChannelId: _mainChannel.name,
      methodChannel: MethodChannel(
          '${NativeCommunicationMetadata.platformMethodChannel}.$id'),
      eventChannel:
          EventChannel('${NativeCommunicationMetadata.hostEventChannel}.$id'),
      callBacksController: controller,
    );

    _entrypointsHistory.putIfAbsent(response.id, () => true);

    _entrypointsHistory.update(response.id, (_) => true);

    return _actualEntrypoint!;
  }

  @override
  Map<String, bool> get entrypoints => _entrypointsHistory;

  @override
  Future<void> dispose(DisposeRequest request) async {
    log('DevicePlatform -> dispose: ${request.id}');

    final answer = await _mainChannel.invokeMethod<Map<dynamic, dynamic>>(
        'dispose', request.toMap());

    if (answer == null) {
      throw ChannelInvalidAnswerException();
    }

    _actualEntrypoint?.dispose();

    final _ = DisposeResponse.fromMap(answer);

    _entrypointsHistory.update(request.id, (_) => false);

    return;
  }
}
