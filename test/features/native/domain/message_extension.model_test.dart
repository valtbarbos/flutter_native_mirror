import 'package:flutter/services.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/generated/proto/message.pbserver.dart';
import 'package:flutter_native_mirror/feature/native/environment/environment.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/services/services.nativechannels.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'WHEN call [PayloadX] apply() on a playload message with reported error'
      'THEN should throw [PlatformException] ', (
    WidgetTester tester,
  ) async {
    // arranje

    final message = PlatformEntrypoint.defaultListenerSetup(
      namespace: NativeCommunicationMetadata.businessNamespace,
      targetMethod: 'playgroundStart',
      targetMethodCancellation: 'playgroundStop',
    );

    message.error = Error(
      code: 'generic-error',
      details: 'throwing a mocked exception',
      message: 'just do it',
    );

    // act && assert

    expect(
        () => message.validation(),
        throwsA(
          const TypeMatcher<PlatformException>(),
        ));
  });

  testWidgets(
      'WHEN call [PayloadX] apply() on an invalid playload message'
      'THEN should throw [PlatformException] ', (
    WidgetTester tester,
  ) async {
    // arranje

    final message = PlatformEntrypoint.defaultListenerSetup(
      namespace: NativeCommunicationMetadata.businessNamespace,
      targetMethod: 'playgroundStart',
      targetMethodCancellation: 'playgroundStop',
    );

    // act && assert

    expect(
        () => message.validation(),
        throwsA(
          const TypeMatcher<PlatformException>(),
        ));
  });
}
