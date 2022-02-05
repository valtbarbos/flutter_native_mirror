///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $0;
import '../google/protobuf/any.pb.dart' as $1;

import 'message.pbenum.dart';

export 'message.pbenum.dart';

class Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Header', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objectClass', protoName: 'objectClass')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionMethod', protoName: 'actionMethod')
    ..e<Header_CommunicationType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'communicationType', $pb.PbFieldType.OE, protoName: 'communicationType', defaultOrMaker: Header_CommunicationType.SETUP, valueOf: Header_CommunicationType.valueOf, enumValues: Header_CommunicationType.values)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdated', subBuilder: $0.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'callBackMethodHandler', protoName: 'callBackMethodHandler')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cancelationMethod', protoName: 'cancelationMethod')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'callBackId', $pb.PbFieldType.O3, protoName: 'callBackId')
    ..hasRequiredFields = false
  ;

  Header._() : super();
  factory Header({
    $core.String? id,
    $core.String? objectClass,
    $core.String? actionMethod,
    Header_CommunicationType? communicationType,
    $0.Timestamp? lastUpdated,
    $core.String? callBackMethodHandler,
    $core.String? cancelationMethod,
    $core.int? callBackId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (objectClass != null) {
      _result.objectClass = objectClass;
    }
    if (actionMethod != null) {
      _result.actionMethod = actionMethod;
    }
    if (communicationType != null) {
      _result.communicationType = communicationType;
    }
    if (lastUpdated != null) {
      _result.lastUpdated = lastUpdated;
    }
    if (callBackMethodHandler != null) {
      _result.callBackMethodHandler = callBackMethodHandler;
    }
    if (cancelationMethod != null) {
      _result.cancelationMethod = cancelationMethod;
    }
    if (callBackId != null) {
      _result.callBackId = callBackId;
    }
    return _result;
  }
  factory Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Header clone() => Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Header copyWith(void Function(Header) updates) => super.copyWith((message) => updates(message as Header)) as Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  Header createEmptyInstance() => create();
  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectClass => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectClass($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasObjectClass() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectClass() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get actionMethod => $_getSZ(2);
  @$pb.TagNumber(3)
  set actionMethod($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActionMethod() => $_has(2);
  @$pb.TagNumber(3)
  void clearActionMethod() => clearField(3);

  @$pb.TagNumber(4)
  Header_CommunicationType get communicationType => $_getN(3);
  @$pb.TagNumber(4)
  set communicationType(Header_CommunicationType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCommunicationType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommunicationType() => clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get lastUpdated => $_getN(4);
  @$pb.TagNumber(5)
  set lastUpdated($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastUpdated() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastUpdated() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureLastUpdated() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get callBackMethodHandler => $_getSZ(5);
  @$pb.TagNumber(6)
  set callBackMethodHandler($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCallBackMethodHandler() => $_has(5);
  @$pb.TagNumber(6)
  void clearCallBackMethodHandler() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cancelationMethod => $_getSZ(6);
  @$pb.TagNumber(7)
  set cancelationMethod($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCancelationMethod() => $_has(6);
  @$pb.TagNumber(7)
  void clearCancelationMethod() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get callBackId => $_getIZ(7);
  @$pb.TagNumber(8)
  set callBackId($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCallBackId() => $_has(7);
  @$pb.TagNumber(8)
  void clearCallBackId() => clearField(8);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Error', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details')
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error({
    $core.String? message,
    $core.String? code,
    $core.String? details,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (code != null) {
      _result.code = code;
    }
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Error clone() => Error()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error)) as Error; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get details => $_getSZ(2);
  @$pb.TagNumber(3)
  set details($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetails() => clearField(3);
}

class Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Result', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOM<$1.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valuebytes', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  Result._() : super();
  factory Result({
    $core.String? type,
    $core.String? value,
    $1.Any? valuebytes,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (value != null) {
      _result.value = value;
    }
    if (valuebytes != null) {
      _result.valuebytes = valuebytes;
    }
    return _result;
  }
  factory Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Result clone() => Result()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Result copyWith(void Function(Result) updates) => super.copyWith((message) => updates(message as Result)) as Result; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Result create() => Result._();
  Result createEmptyInstance() => create();
  static $pb.PbList<Result> createRepeated() => $pb.PbList<Result>();
  @$core.pragma('dart2js:noInline')
  static Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Result>(create);
  static Result? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $1.Any get valuebytes => $_getN(2);
  @$pb.TagNumber(3)
  set valuebytes($1.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValuebytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearValuebytes() => clearField(3);
  @$pb.TagNumber(3)
  $1.Any ensureValuebytes() => $_ensure(2);
}

class Payload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Payload', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..aOM<Error>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: Error.create)
    ..hasRequiredFields = false
  ;

  Payload._() : super();
  factory Payload({
    Result? result,
    Error? error,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory Payload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payload clone() => Payload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payload copyWith(void Function(Payload) updates) => super.copyWith((message) => updates(message as Payload)) as Payload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Payload create() => Payload._();
  Payload createEmptyInstance() => create();
  static $pb.PbList<Payload> createRepeated() => $pb.PbList<Payload>();
  @$core.pragma('dart2js:noInline')
  static Payload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payload>(create);
  static Payload? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);

  @$pb.TagNumber(2)
  Error get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(Error v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  Error ensureError() => $_ensure(1);
}

class Generic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Generic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  Generic._() : super();
  factory Generic({
    $core.String? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Generic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Generic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Generic clone() => Generic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Generic copyWith(void Function(Generic) updates) => super.copyWith((message) => updates(message as Generic)) as Generic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Generic create() => Generic._();
  Generic createEmptyInstance() => create();
  static $pb.PbList<Generic> createRepeated() => $pb.PbList<Generic>();
  @$core.pragma('dart2js:noInline')
  static Generic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Generic>(create);
  static Generic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class MirrorMethodCall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MirrorMethodCall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'method')
    ..aOM<$1.Any>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arguments', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  MirrorMethodCall._() : super();
  factory MirrorMethodCall({
    $core.String? method,
    $1.Any? arguments,
  }) {
    final _result = create();
    if (method != null) {
      _result.method = method;
    }
    if (arguments != null) {
      _result.arguments = arguments;
    }
    return _result;
  }
  factory MirrorMethodCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MirrorMethodCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MirrorMethodCall clone() => MirrorMethodCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MirrorMethodCall copyWith(void Function(MirrorMethodCall) updates) => super.copyWith((message) => updates(message as MirrorMethodCall)) as MirrorMethodCall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MirrorMethodCall create() => MirrorMethodCall._();
  MirrorMethodCall createEmptyInstance() => create();
  static $pb.PbList<MirrorMethodCall> createRepeated() => $pb.PbList<MirrorMethodCall>();
  @$core.pragma('dart2js:noInline')
  static MirrorMethodCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MirrorMethodCall>(create);
  static MirrorMethodCall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get method => $_getSZ(0);
  @$pb.TagNumber(1)
  set method($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMethod() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethod() => clearField(1);

  @$pb.TagNumber(2)
  $1.Any get arguments => $_getN(1);
  @$pb.TagNumber(2)
  set arguments($1.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearArguments() => clearField(2);
  @$pb.TagNumber(2)
  $1.Any ensureArguments() => $_ensure(1);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<Header>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: Header.create)
    ..aOM<Payload>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', subBuilder: Payload.create)
    ..aOM<MirrorMethodCall>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'methodCall', protoName: 'methodCall', subBuilder: MirrorMethodCall.create)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    Header? header,
    Payload? payload,
    MirrorMethodCall? methodCall,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (payload != null) {
      _result.payload = payload;
    }
    if (methodCall != null) {
      _result.methodCall = methodCall;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  Header get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(Header v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  Header ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  Payload get payload => $_getN(1);
  @$pb.TagNumber(2)
  set payload(Payload v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);
  @$pb.TagNumber(2)
  Payload ensurePayload() => $_ensure(1);

  @$pb.TagNumber(3)
  MirrorMethodCall get methodCall => $_getN(2);
  @$pb.TagNumber(3)
  set methodCall(MirrorMethodCall v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMethodCall() => $_has(2);
  @$pb.TagNumber(3)
  void clearMethodCall() => clearField(3);
  @$pb.TagNumber(3)
  MirrorMethodCall ensureMethodCall() => $_ensure(2);
}

