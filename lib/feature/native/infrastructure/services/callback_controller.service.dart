part of './services.nativechannels.dart';

/// Manage our channels instances and listeners by [targetMethod]
/// callback registered.
class CallBacksController implements ICallBacksController {
  static const String _tag = 'CallBacksController';

  /// CallBackMethod<T>
  /// here we can't use this.
  final _callbacks = <CallBackMethod<MirrorMethodCall, Error>>{};

  static final CallBacksController _singleton = CallBacksController._internal();

  factory CallBacksController() {
    return _singleton;
  }

  CallBacksController._internal();

  int _nextCallBackReferenceId = 0;

  int get lastAddedcallBackReferenceId => _nextCallBackReferenceId;

  @override
  int get registeredCallbacksCount => _callbacks.length;

  @override
  Future<dynamic> platformCallBackMethodHandlerSetup(MethodCall call) async {
    try {
      if (_callbacks.isEmpty) {
        // throw Exception('No callback registered.');
        // TODO(v): maybe there is a delay between hosts callbacks invoke
        log('SUPOSE TO: \nthrow Exception(\'No callback registered.\');',
            level: 2000);
        return Future.value('[Platform info]: No callback registered.');
      }

      switch (call.method) {
        case PlatformEntrypoint.setupMethodHandler:
        case PlatformEntrypoint.platformCallBackMethodHandler:
          Message message = Message.fromBuffer(call.arguments);

          if (message.header.intent == Header_CommunicationType.CANCELATION) {
            disposeCallBack(message.header.callBackReferenceId);
            break;
          }

          int id = message.header.callBackReferenceId;

          if (id == 0) {
            throw Exception('Invalid [callback id] value.');
          }

          /// On this case we can call a global dispose on host.
          /// Means that there are more instances inside our native channel.
          if (!_callbacks.any((e) => e.id == id)) {
            // TODO(v): maybe there is a delay between hosts callbacks invoke
            log('SUPOSE TO: \nthrow Exception(\'Invalid [callback id]. Is this callback disposed?\');',
                level: 2000);
            return Future.value('[Platform info]: callback id not found');
            // throw Exception(
            //     'Invalid [callback id]. Is this callback disposed?');
          }

          final dynamicMethod =
              _callbacks.firstWhere((element) => element.id == id);

          // TODO(v): function references doesn't throw explicit runtime exceptions on message.apply
          // final arguments = await message.apply();

          dynamicMethod.call(
            message.methodCall,
            message.error,
          );

          break;
        default:
          log('CallBacksController, platformCallBackMethodHandlerSetup -> IGNORING: ${call.method}');
          break;
      }
    } catch (e, s) {
      log('CallBacksController, platformCallBackMethodHandlerSetup\n$call',
          name: _tag, stackTrace: s, error: e);
      rethrow;
    }
  }

  @override
  bool isAlreadyRegistered({required String targetMethod}) =>
      _callbacks.any((e) => e.message.header.targetMethod == targetMethod);

  /// If [listenerCancelation] method is provided
  /// It will dispose the current [targetMethod] listener.
  /// Can be used like a [restart] on our actual callback listener,
  /// and avoid duplicated listeners.
  Future<void> disposeActiveCallbackListener({
    required String targetMethod,
    required CancelListening Function(Message msg) listenerCancelation,
  }) async {
    CallBackMethod<dynamic, dynamic> callBack;

    try {
      callBack = _callbacks
          .firstWhere((e) => e.message.header.targetMethod == targetMethod);
    } on StateError catch (_) {
      return;
    } on Exception catch (e, s) {
      log('disposeActiveCallbackListener:',
          name: _tag, stackTrace: s, error: e);
      rethrow;
    }

    try {
      await listenerCancelation.call(callBack.message).call().then((_) {
        disposeCallBack(callBack.id);
      });
    } catch (e, s) {
      log('CancelListening, listenerCancelation\n',
          name: _tag, stackTrace: s, error: e);
      throw Exception('CancelListening listenerCancelation() fail.');
    }
  }

  /// If call [setCallBack] to a [targetMethod] already registered,
  /// then will dispose the actual callback listener before continue.
  @override
  void setCallBack({
    required CallBackMethod<MirrorMethodCall, Error> call,
  }) {
    if (isAlreadyRegistered(targetMethod: call.message.header.targetMethod)) {
      // throw Exception(
      //     'targetMethod: [call.message.header.targetMethod] already registered.');
      log('SUPOSE TO: \nthrow Exception(\'targetMethod: [call.message.header.targetMethod] already registered.\');',
          level: 2000);
      return;
    }

    _nextCallBackReferenceId++;

    call.message.header.callBackReferenceId = _nextCallBackReferenceId;

    _callbacks.add(call);

    log('CallBacksController, setCallBack -> $_nextCallBackReferenceId : ${call.message.header.targetMethod}');
  }

  @override
  void disposeCallBack(int callBackReferenceId) {
    log('CallBacksController, disposeCallBack -> $callBackReferenceId');
    _callbacks.removeWhere(
        (e) => e.message.header.callBackReferenceId == callBackReferenceId);
  }
}
