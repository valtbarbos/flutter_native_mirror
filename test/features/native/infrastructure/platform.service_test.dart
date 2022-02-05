import 'dart:developer';

import 'package:flutter_native_mirror/feature/native/domain/interfaces/interfaces.nativechannels.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/infrastructure.plaftorm.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';
import '../fixtures/native_channels.fixture.dart';

void main() {
  Helpers helpers = Helpers();

  setUp(() {
    log('setUp');
    helpers.resetChannels = true;
    helpers.mockPlatformChannels = MockPlatformChannels();
  });

  tearDown(() {
    log('tearDown');
    helpers.resetChannels = false;
    helpers.mockPlatformChannels.byPass();
  });

  group('platform', () {
    testWidgets(
        'when [init] requests many new main channel instance '
        'then serialize an [initExpectedResponse] result '
        'and match our initial instance [id]', (WidgetTester tester) async {
      // arranje

      final id = Helpers.uuid.v4();

      helpers.mockPlatformChannels.setExpectedBehavior(
        response: InitResponse(id: id),
      );

      late IPlatformEntrypoint entrypoint;

      // entrypoint indempotence
      for (var _ in [0, 1, 2]) {
        // act
        entrypoint = await helpers.generateEntrypoint(
          id: Helpers.uuid.v4(),
          tester: tester,
        );
      }

      // assert

      expect(id, entrypoint.id);

      expect(helpers.devicePlatform.entrypoints.containsKey(id), true);

      expect(helpers.devicePlatform.entrypoints.length, 1);
    });

    testWidgets(
        'when [dispose] request method '
        'then the method channel do not responds '
        'and throws an [ChannelInvalidAnswerException]',
        (WidgetTester tester) async {
      // arranje

      final id = await helpers.platformSetUp(tester: tester);

      helpers.mockPlatformChannels.byPass();

      // act && assert

      expect(() => helpers.devicePlatform.dispose(DisposeRequest(id: id)),
          throwsA(const TypeMatcher<ChannelInvalidAnswerException>()));
    });

    testWidgets(
        'when [dispose] '
        'then should remove all entrypoints registers.',
        (WidgetTester tester) async {
      // arranje

      final id = await helpers.platformSetUp(tester: tester);

      helpers.mockPlatformChannels.setExpectedBehavior(
        response: DisposeResponse(id: id),
      );

      final _ = await helpers.devicePlatform.dispose(DisposeRequest(id: id));

      expect(helpers.devicePlatform.entrypoints.containsKey(id), true);

      expect(helpers.devicePlatform.entrypoints.length, 1);

      expect(helpers.devicePlatform.entrypoints[id], false);
    });
  });
}
