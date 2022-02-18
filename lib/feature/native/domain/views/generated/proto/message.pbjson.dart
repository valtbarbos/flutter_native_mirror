///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use headerDescriptor instead')
const Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'namespace', '3': 2, '4': 1, '5': 9, '10': 'namespace'},
    const {'1': 'targetMethod', '3': 3, '4': 1, '5': 9, '10': 'targetMethod'},
    const {'1': 'targetMethodCancellation', '3': 7, '4': 1, '5': 9, '10': 'targetMethodCancellation'},
    const {'1': 'platformCallBackMethodHandler', '3': 6, '4': 1, '5': 9, '10': 'platformCallBackMethodHandler'},
    const {'1': 'callBackReferenceId', '3': 8, '4': 1, '5': 5, '10': 'callBackReferenceId'},
    const {'1': 'intent', '3': 4, '4': 1, '5': 14, '6': '.protos.Header.CommunicationType', '10': 'intent'},
  ],
  '4': const [Header_CommunicationType$json],
};

@$core.Deprecated('Use headerDescriptor instead')
const Header_CommunicationType$json = const {
  '1': 'CommunicationType',
  '2': const [
    const {'1': 'SETUP', '2': 0},
    const {'1': 'CANCELATION', '2': 1},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode('CgZIZWFkZXISDgoCaWQYASABKAlSAmlkEhwKCW5hbWVzcGFjZRgCIAEoCVIJbmFtZXNwYWNlEiIKDHRhcmdldE1ldGhvZBgDIAEoCVIMdGFyZ2V0TWV0aG9kEjoKGHRhcmdldE1ldGhvZENhbmNlbGxhdGlvbhgHIAEoCVIYdGFyZ2V0TWV0aG9kQ2FuY2VsbGF0aW9uEkQKHXBsYXRmb3JtQ2FsbEJhY2tNZXRob2RIYW5kbGVyGAYgASgJUh1wbGF0Zm9ybUNhbGxCYWNrTWV0aG9kSGFuZGxlchIwChNjYWxsQmFja1JlZmVyZW5jZUlkGAggASgFUhNjYWxsQmFja1JlZmVyZW5jZUlkEjgKBmludGVudBgEIAEoDjIgLnByb3Rvcy5IZWFkZXIuQ29tbXVuaWNhdGlvblR5cGVSBmludGVudCIvChFDb21tdW5pY2F0aW9uVHlwZRIJCgVTRVRVUBAAEg8KC0NBTkNFTEFUSU9OEAE=');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'details', '3': 3, '4': 1, '5': 9, '10': 'details'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode('CgVFcnJvchIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEhIKBGNvZGUYAiABKAlSBGNvZGUSGAoHZGV0YWlscxgDIAEoCVIHZGV0YWlscw==');
@$core.Deprecated('Use payloadDescriptor instead')
const Payload$json = const {
  '1': 'Payload',
  '2': const [
    const {'1': 'shouldBeEmpty', '3': 4, '4': 1, '5': 8, '10': 'shouldBeEmpty'},
    const {'1': 'valuebytes', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'valuebytes'},
  ],
};

/// Descriptor for `Payload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadDescriptor = $convert.base64Decode('CgdQYXlsb2FkEiQKDXNob3VsZEJlRW1wdHkYBCABKAhSDXNob3VsZEJlRW1wdHkSNAoKdmFsdWVieXRlcxgDIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSCnZhbHVlYnl0ZXM=');
@$core.Deprecated('Use genericDescriptor instead')
const Generic$json = const {
  '1': 'Generic',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `Generic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericDescriptor = $convert.base64Decode('CgdHZW5lcmljEhIKBGRhdGEYASABKAlSBGRhdGE=');
@$core.Deprecated('Use mirrorMethodCallDescriptor instead')
const MirrorMethodCall$json = const {
  '1': 'MirrorMethodCall',
  '2': const [
    const {'1': 'method', '3': 1, '4': 1, '5': 9, '10': 'method'},
    const {'1': 'arguments', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'arguments'},
  ],
};

/// Descriptor for `MirrorMethodCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mirrorMethodCallDescriptor = $convert.base64Decode('ChBNaXJyb3JNZXRob2RDYWxsEhYKBm1ldGhvZBgBIAEoCVIGbWV0aG9kEjIKCWFyZ3VtZW50cxgCIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSCWFyZ3VtZW50cw==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.protos.Header', '10': 'header'},
    const {'1': 'payload', '3': 2, '4': 1, '5': 11, '6': '.protos.Payload', '10': 'payload'},
    const {'1': 'error', '3': 3, '4': 1, '5': 11, '6': '.protos.Error', '10': 'error'},
    const {'1': 'methodCall', '3': 4, '4': 1, '5': 11, '6': '.protos.MirrorMethodCall', '10': 'methodCall'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEiYKBmhlYWRlchgBIAEoCzIOLnByb3Rvcy5IZWFkZXJSBmhlYWRlchIpCgdwYXlsb2FkGAIgASgLMg8ucHJvdG9zLlBheWxvYWRSB3BheWxvYWQSIwoFZXJyb3IYAyABKAsyDS5wcm90b3MuRXJyb3JSBWVycm9yEjgKCm1ldGhvZENhbGwYBCABKAsyGC5wcm90b3MuTWlycm9yTWV0aG9kQ2FsbFIKbWV0aG9kQ2FsbA==');
