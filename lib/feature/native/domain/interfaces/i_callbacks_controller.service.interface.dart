part of 'interfaces.nativechannels.dart';

abstract class ICallBacksController {
  Future<void> platformCallBackMethodHandlerSetup(MethodCall call);
  bool isAlreadyRegistered({required String targetMethod});
  int get registeredCallbacksCount;
  void setCallBack({required CallBackMethod<MirrorMethodCall, Error> call});
  void disposeCallBack(int callBackReferenceId);
}
