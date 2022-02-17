part of './services.nativechannels.dart';

/// An implementation of [IPlatformEntrypoint] that uses method channels.
class PlatformEntrypoint extends IPlatformEntrypoint {
  static const String _tag = 'PlatformEntrypoint';

  PlatformEntrypoint({
    required String id,
    required String mainChannelId,
    required MethodChannel methodChannel,
    required EventChannel eventChannel,
    required CallBacksController callBacksController,
  }) : super(
            id: id,
            mainChannelId: mainChannelId,
            methodChannel: methodChannel,
            eventChannel: eventChannel,
            callbacksController: callBacksController);

  static const String setupMethodHandler = 'callback';

  static const String callBackMethodHandler = 'callBackMethodHandler';

  /// Remember that proto3 doesn't allow [required] fields anymore.
  /// AND, [Message] was generated by our .proto config file.
  /// Because of this  I put this 'factory' here as an extension.
  static Message defaultListenerSetup({
    required objectClass,
    required actionMethod,
    required cancelationMethod,
    Result? args,
  }) {
    return Message(
      header: Header(
        id: '_',
        objectClass: objectClass,
        actionMethod: actionMethod,
        cancelationMethod: cancelationMethod,
        callBackMethodHandler: PlatformEntrypoint.callBackMethodHandler,
        communicationType: Header_CommunicationType.SETUP,
      ),
      payload: Payload(
        result: args,
      ),
    );
  }

  @override
  Future<CancelListening> startListening({
    required Message message,
    required MultiUseCallback<MirrorMethodCall, Error> callback,
  }) async {
    await callbacksController.disposeActiveCallbackListener(
      actionMethod: message.header.actionMethod,
      listenerCancelation: listenerCancelation,
    );

    final callbackMethod = CallBackMethod<MirrorMethodCall, Error>(
      message: message,
      call: callback,
    );

    callbacksController.setCallBack(call: callbackMethod);

    methodChannel
        .setMethodCallHandler(callbacksController.callBackMethodHandlerSetup);

    message.header.id = id;

    message.header.callBackId = callbacksController.lastAddedCallbackId;

    final _ = await methodChannel.invokeMethod(
      PlatformEntrypoint.setupMethodHandler,
      message.writeToBuffer(),
    );

    return listenerCancelation(message);
  }

  CancelListening listenerCancelation(Message message) {
    // send same message to the [listener cancellation]
    message.header.communicationType = Header_CommunicationType.CANCELATION;

    return () async {
      try {
        final response = await methodChannel.invokeMethod(
          PlatformEntrypoint.setupMethodHandler,
          message.writeToBuffer(),
        );

        /// TODO(v): catch only with unit tests mock
        if (response == null) {
          return;
        }

        log('entrypoint -> listenerCancelation\n${message.header.cancelationMethod}\n');
      } catch (e, s) {
        log('listenerCancelation -> CancelListening\n',
            name: _tag, stackTrace: s, error: e);
        rethrow;
      }
    };
  }

  @override
  Stream<EventMessage> get eventMessageStream => eventChannel
          .receiveBroadcastStream()
          .cast<Map<dynamic, dynamic>>()
          .map((map) {
        return EventMessage.fromMap(map);
      });

  /// throws:
  /// [ChannelInvalidAnswerException]
  /// [Exception]
  @override
  Future<Message> send(Message request) async {
    Message? messageFromProto;

    dynamic response;

    try {
      response = await methodChannel.invokeMethod(
        'rpc',
        request.writeToBuffer(),
      );
    } catch (e, s) {
      log('send:', name: _tag, stackTrace: s, error: e);
      throw ChannelInvokeException();
    }

    if (response == null) {
      throw ChannelInvalidAnswerException();
    }

    try {
      messageFromProto = Message.fromBuffer(response);
    } catch (_) {
      throw ProtoBufferException();
    }

    return messageFromProto;
  }

  @override
  void dispose() {
    return;
  }
}
