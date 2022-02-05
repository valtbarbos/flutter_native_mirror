part of 'interfaces.nativechannels.dart';

abstract class IDevicePlatform {
  /// Creates a new [platform<->host] channel
  /// and returns a nested platform entrypoint.
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
  });

  /// .
  Future<void> dispose(DisposeRequest request);

  Map<String, bool> get entrypoints;
}
