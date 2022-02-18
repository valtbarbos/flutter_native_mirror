///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/any.pb.dart' as $0;

import 'message.pbenum.dart';

export 'message.pbenum.dart';

class Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Header', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'namespace')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetMethod', protoName: 'targetMethod')
    ..e<Header_CommunicationType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intent', $pb.PbFieldType.OE, defaultOrMaker: Header_CommunicationType.SETUP, valueOf: Header_CommunicationType.valueOf, enumValues: Header_CommunicationType.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platformCallBackMethodHandler', protoName: 'platformCallBackMethodHandler')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetMethodCancellation', protoName: 'targetMethodCancellation')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'callBackReferenceId', $pb.PbFieldType.O3, protoName: 'callBackReferenceId')
    ..hasRequiredFields = false
  ;

  Header._() : super();
  factory Header({
    $core.String? id,
    $core.String? namespace,
    $core.String? targetMethod,
    Header_CommunicationType? intent,
    $core.String? platformCallBackMethodHandler,
    $core.String? targetMethodCancellation,
    $core.int? callBackReferenceId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (namespace != null) {
      _result.namespace = namespace;
    }
    if (targetMethod != null) {
      _result.targetMethod = targetMethod;
    }
    if (intent != null) {
      _result.intent = intent;
    }
    if (platformCallBackMethodHandler != null) {
      _result.platformCallBackMethodHandler = platformCallBackMethodHandler;
    }
    if (targetMethodCancellation != null) {
      _result.targetMethodCancellation = targetMethodCancellation;
    }
    if (callBackReferenceId != null) {
      _result.callBackReferenceId = callBackReferenceId;
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
  $core.String get namespace => $_getSZ(1);
  @$pb.TagNumber(2)
  set namespace($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNamespace() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamespace() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get targetMethod => $_getSZ(2);
  @$pb.TagNumber(3)
  set targetMethod($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTargetMethod() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetMethod() => clearField(3);

  @$pb.TagNumber(4)
  Header_CommunicationType get intent => $_getN(3);
  @$pb.TagNumber(4)
  set intent(Header_CommunicationType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIntent() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntent() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get platformCallBackMethodHandler => $_getSZ(4);
  @$pb.TagNumber(6)
  set platformCallBackMethodHandler($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlatformCallBackMethodHandler() => $_has(4);
  @$pb.TagNumber(6)
  void clearPlatformCallBackMethodHandler() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get targetMethodCancellation => $_getSZ(5);
  @$pb.TagNumber(7)
  set targetMethodCancellation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTargetMethodCancellation() => $_has(5);
  @$pb.TagNumber(7)
  void clearTargetMethodCancellation() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get callBackReferenceId => $_getIZ(6);
  @$pb.TagNumber(8)
  set callBackReferenceId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCallBackReferenceId() => $_has(6);
  @$pb.TagNumber(8)
  void clearCallBackReferenceId() => clearField(8);
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

class Payload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Payload', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<$0.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valuebytes', subBuilder: $0.Any.create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shouldBeEmpty', protoName: 'shouldBeEmpty')
    ..hasRequiredFields = false
  ;

  Payload._() : super();
  factory Payload({
    $0.Any? valuebytes,
    $core.bool? shouldBeEmpty,
  }) {
    final _result = create();
    if (valuebytes != null) {
      _result.valuebytes = valuebytes;
    }
    if (shouldBeEmpty != null) {
      _result.shouldBeEmpty = shouldBeEmpty;
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

  @$pb.TagNumber(3)
  $0.Any get valuebytes => $_getN(0);
  @$pb.TagNumber(3)
  set valuebytes($0.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValuebytes() => $_has(0);
  @$pb.TagNumber(3)
  void clearValuebytes() => clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureValuebytes() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.bool get shouldBeEmpty => $_getBF(1);
  @$pb.TagNumber(4)
  set shouldBeEmpty($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasShouldBeEmpty() => $_has(1);
  @$pb.TagNumber(4)
  void clearShouldBeEmpty() => clearField(4);
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
    ..aOM<$0.Any>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arguments', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  MirrorMethodCall._() : super();
  factory MirrorMethodCall({
    $core.String? method,
    $0.Any? arguments,
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
  $0.Any get arguments => $_getN(1);
  @$pb.TagNumber(2)
  set arguments($0.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearArguments() => clearField(2);
  @$pb.TagNumber(2)
  $0.Any ensureArguments() => $_ensure(1);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<Header>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: Header.create)
    ..aOM<Payload>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', subBuilder: Payload.create)
    ..aOM<Error>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: Error.create)
    ..aOM<MirrorMethodCall>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'methodCall', protoName: 'methodCall', subBuilder: MirrorMethodCall.create)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    Header? header,
    Payload? payload,
    Error? error,
    MirrorMethodCall? methodCall,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (payload != null) {
      _result.payload = payload;
    }
    if (error != null) {
      _result.error = error;
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
  Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(Error v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  Error ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  MirrorMethodCall get methodCall => $_getN(3);
  @$pb.TagNumber(4)
  set methodCall(MirrorMethodCall v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMethodCall() => $_has(3);
  @$pb.TagNumber(4)
  void clearMethodCall() => clearField(4);
  @$pb.TagNumber(4)
  MirrorMethodCall ensureMethodCall() => $_ensure(3);
}

