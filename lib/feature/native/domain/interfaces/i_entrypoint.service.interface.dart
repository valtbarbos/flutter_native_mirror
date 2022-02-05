part of 'interfaces.nativechannels.dart';

abstract class IPlatformEntrypoint {
  final String id;
  final String mainChannelId;

  final MethodChannel methodChannel;
  final EventChannel eventChannel;
  final CallBacksController callbacksController;

  IPlatformEntrypoint({
    required this.id,
    required this.mainChannelId,
    required this.methodChannel,
    required this.eventChannel,
    required this.callbacksController,
  });

  /// A broadcast stream of events.
  Stream<EventMessage> get eventMessageStream;

  Future<Message> send(Message request);

  Future<CancelListening> startListening({
    required Message message,
    required MultiUseCallback<MirrorMethodCall, Error> callback,
  });

  void dispose();
}
