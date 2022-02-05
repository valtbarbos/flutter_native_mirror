import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';

class MockPlatformChannels {
  static final MockPlatformChannels _singleton =
      MockPlatformChannels._internal();

  factory MockPlatformChannels() {
    return _singleton;
  }

  MockPlatformChannels._internal();

  dynamic _response;

  void Function()? _broadcast;

  void setExpectedBehavior({
    required dynamic response,
    void Function()? broadcast,
  }) {
    log('MockPlatformChannels -> setExpectedBehavior: response: ${response.runtimeType}');
    _response = response;
    _broadcast = broadcast;
  }

  Future<dynamic> onMethodCall(MethodCall call) async {
    log('MockPlatformChannels -> onMethodCall: response: ${call.method}');
    switch (call.method) {
      case 'init':
        return Future.value((_response as InitResponse?)?.toMap());
      case 'dispose':
        return Future.value((_response as DisposeResponse?)?.toMap());
      case 'rpc':
        return Future.value(_response);
      case 'callback':
        (_response as Function).call();
        break;
      default:
        _broadcast?.call();
        return Future.value(_response?.toMap());
    }
  }

  void byPass() {
    _response = null;
    _broadcast = null;
  }
}
