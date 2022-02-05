///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Header_CommunicationType extends $pb.ProtobufEnum {
  static const Header_CommunicationType SETUP = Header_CommunicationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SETUP');
  static const Header_CommunicationType CANCELATION = Header_CommunicationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELATION');

  static const $core.List<Header_CommunicationType> values = <Header_CommunicationType> [
    SETUP,
    CANCELATION,
  ];

  static final $core.Map<$core.int, Header_CommunicationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Header_CommunicationType? valueOf($core.int value) => _byValue[value];

  const Header_CommunicationType._($core.int v, $core.String n) : super(v, n);
}

