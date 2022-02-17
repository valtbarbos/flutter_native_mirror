part of './models.devicekit.dart';

typedef MultiUseCallback<K, V> = void Function(
  K methodCall,
  V error,
);

typedef CancelListening = Future<void> Function();

/// Keeps a log from each setCallback request.
/// Simplify the way how we can controll some aspects,
/// like dispose some resource from an internal command.
/// Exposes some useful read-only properties*.
class CallBackMethod<K, V> {
  late Message _message;
  late MultiUseCallback<K, V> _call;

  CallBackMethod({
    required Message message,
    required MultiUseCallback<K, V> call,
  }) {
    _message = message;
    _call = call;
  }

  Message get message => _message;

  MultiUseCallback<K, V> get call => _call;

  int get id => _message.header.callBackReferenceId;
}

abstract class INativeModel extends Equatable {
  final String id;

  const INativeModel({
    required this.id,
  });

  Map<dynamic, dynamic> toMap() => <dynamic, dynamic>{
        'id': id,
      };

  @override
  List<Object> get props => [
        id,
      ];
}

/// Information communicated to the platform implementation when creating a new
/// ble instance.
class InitRequest extends INativeModel {
  const InitRequest({
    required String id,
  }) : super(id: id);
}

/// Information communicated to the platform implementation when creating a new
/// ble instance.
class InitResponse extends INativeModel {
  const InitResponse({
    required String id,
  }) : super(id: id);

  static InitResponse fromMap(Map map) => InitResponse(
        id: map['id'],
      );
}

/// Information communicated to the platform implementation when disposing of a
/// ble instance.
class DisposeRequest extends INativeModel {
  const DisposeRequest({
    required String id,
  }) : super(id: id);
}

/// Information returned by the platform implementation after disposing of a
/// ble instance.
class DisposeResponse extends INativeModel {
  const DisposeResponse({
    required String id,
  }) : super(id: id);

  @override
  Map<dynamic, dynamic> toMap() => <dynamic, dynamic>{
        'id': id,
      };

  static DisposeResponse fromMap(Map map) => DisposeResponse(
        id: map['id'],
      );
}

/// A data update communicated from the platform implementation to the Flutter
/// plugin. Each field should trigger a state update in the frontend plugin if
/// and only if it is not null. Normally, the platform implementation will not
/// need to broadcast new state changes for this state as such state changes
/// will be initiated from the frontend.
class EventMessage extends INativeModel {
  final String value;

  const EventMessage({
    required String id,
    required this.value,
  }) : super(id: id);

  @override
  Map<dynamic, dynamic> toMap() => <dynamic, dynamic>{
        'id': id,
        'value': value,
      };

  static EventMessage fromMap(Map map) => EventMessage(
        id: map['id'],
        value: map['value'],
      );

  @override
  List<Object> get props => [
        id,
        value,
      ];
}

// /// A Ble event communicated from the platform implementation to the
// /// Flutter plugin.
// class BleEventMessage {
//   final String value;

//   BleEventMessage({
//     required this.value,
//   });

//   static BleEventMessage fromMap(Map<dynamic, dynamic> map) => BleEventMessage(
//         value: map['value'],
//       );
// }
