import 'dart:developer';

import 'package:flutter_native_mirror/feature/native/domain/interfaces/interfaces.nativechannels.dart';
import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/generated/proto/message.pbserver.dart';
import 'package:flutter_native_mirror/feature/native/domain/views/viewmodels.proto.dart';
import 'package:flutter_native_mirror/feature/native/environment/environment.devicekit.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/infrastructure.plaftorm.dart';
import 'package:flutter_native_mirror/feature/native/infrastructure/services/services.nativechannels.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';
import '../fixtures/native_channels.fixture.dart';

void main() {
  Helpers helpers = Helpers();

  setUp(() {
    log('setUp');
    helpers.resetChannels = true;
    helpers.mockPlatformChannels = MockPlatformChannels();
    helpers.callBacksController = CallBacksController();
  });

  tearDown(() {
    log('tearDown');
    helpers.resetChannels = false;
    helpers.mockPlatformChannels.byPass();
  });

  group('entrypoint', () {
    Future<IPlatformEntrypoint> entrypoint(WidgetTester tester) async {
      // arranje

      final id = Helpers.uuid.v4();

      helpers.mockPlatformChannels.setExpectedBehavior(
        response: InitResponse(id: id),
      );

      // act

      final entrypoint = await helpers.generateEntrypoint(
        id: id,
        tester: tester,
      );

      return entrypoint;
    }

    group('requestWithProtobuf', () {
      //! Type Safe
      testWidgets(
          'when [entrypoint] requestWithProtobuf method '
          'then receives [expectedResponse] '
          'and match our initial instance [id]', (WidgetTester tester) async {
        // arranje

        final entry = await entrypoint(tester);

        final id = entry.id;

        final date = DateTime.now();

        final message = Message(
          header: Header(
            id: id,
            namespace: 'PlatformEntrypoint',
            targetMethod: 'requestWithProtobuf',
          ),
        );

        final responseFromUint8List = Message(
          header: Header(
            id: id,
            namespace: 'PlatformEntrypoint',
            targetMethod: 'requestWithProtobuf',
          ),
        ).writeToBuffer();

        helpers.mockPlatformChannels.setExpectedBehavior(
          response: responseFromUint8List,
        );

        // act

        final response = await entry.send(message);

        // final messageTime = message.header.lastUpdated.toDateTime();

        // final responseTime = response.header.lastUpdated.toDateTime();

        // // assert

        expect(id, response.header.id);

        // expect(messageTime.second < responseTime.second, true);
      });

      testWidgets(
          'when [entrypoint] requestWithProtobuf method '
          'then throws the following exceptions:'
          '[ChannelInvokeException], '
          '[ChannelInvalidAnswerException], '
          '[ProtoBufferException]', (WidgetTester tester) async {
        final entry = await entrypoint(tester);

        final id = entry.id;

        final message = Message(
          header: Header(
            id: id,
            namespace: 'PlatformEntrypoint',
            targetMethod: 'requestWithProtobuf',
          ),
        );

        // ChannelInvokeException
        helpers.mockPlatformChannels.setExpectedBehavior(
          response: message,
        );

        expect(() => entry.send(message),
            throwsA(const TypeMatcher<ChannelInvokeException>()));

        // [ChannelInvalidAnswerException]

        helpers.mockPlatformChannels.byPass();

        expect(() => entry.send(message),
            throwsA(const TypeMatcher<ChannelInvalidAnswerException>()));

        // [ProtoBufferException]
        helpers.mockPlatformChannels.setExpectedBehavior(
          response: 'null',
        );

        // act && assert

        expect(() => entry.send(message),
            throwsA(const TypeMatcher<ProtoBufferException>()));
      });
    });

    group('communication problems', () {
      testWidgets(
          'when [entrypoint] request method '
          'then the [method channel] do not responds '
          'and throws an [ChannelInvokeException]',
          (WidgetTester tester) async {
        // arranje

        // act && assert

        expect(
            () => helpers.generateEntrypoint(
                  id: Helpers.uuid.v4(),
                  tester: tester,
                ),
            throwsA(const TypeMatcher<ChannelInvokeException>()));
      });
    });

    group('eventbus', () {
      testWidgets(
          'when [entrypoint] receives an event '
          'then it should stream it through [eventMessageStream] getter', (
        WidgetTester tester,
      ) async {
        // arranje

        final entry = await entrypoint(tester);

        final id = entry.id;

        // act

        helpers.sendEventThroughEntrypointsEventChannel(
            expectedValue: EventMessage(
          id: id,
          value: 'test',
        ));

        // assert

        await expectLater(
            entry.eventMessageStream,
            emitsInOrder(
              [
                EventMessage(
                  id: id,
                  value: 'test',
                )
              ],
            ));
      });
    });

    group('callback handler', () {
      IPlatformEntrypoint? _entry;

      /// singleton entrypoint instance
      /// reset between mocking platforms and hosts channels.
      Future<IPlatformEntrypoint> groupEntry(WidgetTester tester) async {
        _entry ??= await entrypoint(tester);

        return _entry!;
      }

      Future<CancelListening> startListeningDefaultScenario({
        required WidgetTester tester,
        Payload? expectedResult,
        Error? expectedError,
        MirrorMethodCall? expectedMethodCall,
      }) async {
        try {
          final entry = await groupEntry(tester);

          final expectedAnswer = PlatformEntrypoint.defaultListenerSetup(
            namespace: NativeCommunicationMetadata.businessNamespace,
            targetMethod: 'playgroundStart',
            targetMethodCancellation: 'playgroundStop',
          );

          final result = Payload(
            valuebytes:
                Any.pack(Generic(data: 'From host\'s side: Hello listener!')),
          );

          expectedAnswer.payload = expectedResult ?? result;

          if (expectedError != null) {
            expectedAnswer.error = expectedError;
          }

          expectedAnswer.methodCall = expectedMethodCall ??
              MirrorMethodCall(
                method: 'default',
                arguments: Any.pack(
                    Generic(data: 'From host\'s side: Hello listener!')),
              );

          // expectedAnswer.header.intent =
          //     Header_CommunicationType.CANCELATION;

          // CallbackRequest expectedAnswer;

          helpers.mockPlatformChannels.setExpectedBehavior(
            response: () {
              log('CallbackRequest: arranje setup invoke: ${PlatformEntrypoint.platformCallBackMethodHandler}');

              // arranje

              tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
                helpers.entrypointMethodChannel,
                helpers.callBacksController.platformCallBackMethodHandlerSetup,
              );

              expectedAnswer.header.callBackReferenceId =
                  helpers.callBacksController.lastAddedcallBackReferenceId;

              // act

              helpers.entrypointMethodChannel.invokeMethod(
                PlatformEntrypoint.platformCallBackMethodHandler,
                expectedAnswer.writeToBuffer(),
              );
            },
          );

          // act

          var targetMethodCancellation = await entry.startListening(
              message: expectedAnswer,
              callback: (methodCall, error) async {
                log('startListening -> callback -> args: $methodCall');

                // assert

                final result = await expectedAnswer.validation();

                final exp = Generic();

                expect(methodCall.arguments.canUnpackInto(exp), true);

                methodCall.arguments.unpackInto(exp);

                var packet = Generic.create();

                result.valuebytes.unpackInto(packet);

                expect(exp.data, packet.data);
              });

          return targetMethodCancellation;
        } catch (e, s) {
          log('$e', name: 'entrypoint.service_test', stackTrace: s, error: e);
          rethrow;
        }
      }

      testWidgets(
          'WHEN register a callback method '
          'THEN should receive the expected channel argument call '
          'AND act idempotent in front of successive callbacks setup requests',
          (
        WidgetTester tester,
      ) async {
        // arranje

        late CancelListening targetMethodCancellation;

        // act

        targetMethodCancellation =
            await startListeningDefaultScenario(tester: tester);

        await targetMethodCancellation();

        // ignore: unused_local_variable
        for (var x in [0, 1, 2]) {
          //setupChannels(tester);

          targetMethodCancellation =
              await startListeningDefaultScenario(tester: tester);
        }

        expect(helpers.callBacksController.registeredCallbacksCount, 1);

        await targetMethodCancellation();

        expect(helpers.callBacksController.registeredCallbacksCount, 0);
      });

      testWidgets(
          'WHEN ASDF '
          'THEN should throw [Exception] '
          'AND Fdsa', (
        WidgetTester tester,
      ) async {
        // arranje

        // act

        // ignore: prefer_function_declarations_over_variables
        final _ = () async {
          try {
            return await startListeningDefaultScenario(
              tester: tester,
              expectedError: Error(
                code: 'generic-error',
                details: 'throwing a mocked exception',
                message: 'just do it',
              ),
            );
          } catch (e, s) {
            log('$e', name: 'entrypoint.service_test', stackTrace: s, error: e);
            rethrow;
          }
        };

        // expect(
        //     () async => asdf(),
        //     throwsA(
        //       const TypeMatcher<PlatformException>(),
        //     ));
      });
    });
  });
}
