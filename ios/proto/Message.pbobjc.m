// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: proto/message.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "proto/Message.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ProtosMessageRoot

@implementation ProtosMessageRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - ProtosMessageRoot_FileDescriptor

static GPBFileDescriptor *ProtosMessageRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"protos"
                                                 objcPrefix:@"Protos"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - ProtosHeader

@implementation ProtosHeader

@dynamic id_p;
@dynamic namespace_p;
@dynamic targetMethod;
@dynamic callBackMethodHandler;
@dynamic cancelationMethod;
@dynamic callBackId;
@dynamic communicationType;

typedef struct ProtosHeader__storage_ {
  uint32_t _has_storage_[1];
  ProtosHeader_CommunicationType communicationType;
  int32_t callBackId;
  NSString *id_p;
  NSString *namespace_p;
  NSString *targetMethod;
  NSString *callBackMethodHandler;
  NSString *cancelationMethod;
} ProtosHeader__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "namespace_p",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_Namespace_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, namespace_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetMethod",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_targetMethod,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, targetMethod),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "communicationType",
        .dataTypeSpecific.enumDescFunc = ProtosHeader_CommunicationType_EnumDescriptor,
        .number = ProtosHeader_FieldNumber_CommunicationType,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, communicationType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "callBackMethodHandler",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_CallBackMethodHandler,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, callBackMethodHandler),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "cancelationMethod",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_CancelationMethod,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, cancelationMethod),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "callBackId",
        .dataTypeSpecific.className = NULL,
        .number = ProtosHeader_FieldNumber_CallBackId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(ProtosHeader__storage_, callBackId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosHeader class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosHeader__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\005\003\014\000\004\021\000\006\025\000\007\021\000\010\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t ProtosHeader_CommunicationType_RawValue(ProtosHeader *message) {
  GPBDescriptor *descriptor = [ProtosHeader descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ProtosHeader_FieldNumber_CommunicationType];
  return GPBGetMessageInt32Field(message, field);
}

void SetProtosHeader_CommunicationType_RawValue(ProtosHeader *message, int32_t value) {
  GPBDescriptor *descriptor = [ProtosHeader descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ProtosHeader_FieldNumber_CommunicationType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum ProtosHeader_CommunicationType

GPBEnumDescriptor *ProtosHeader_CommunicationType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "Setup\000Cancelation\000";
    static const int32_t values[] = {
        ProtosHeader_CommunicationType_Setup,
        ProtosHeader_CommunicationType_Cancelation,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(ProtosHeader_CommunicationType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:ProtosHeader_CommunicationType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL ProtosHeader_CommunicationType_IsValidValue(int32_t value__) {
  switch (value__) {
    case ProtosHeader_CommunicationType_Setup:
    case ProtosHeader_CommunicationType_Cancelation:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - ProtosError

@implementation ProtosError

@dynamic message;
@dynamic code;
@dynamic details;

typedef struct ProtosError__storage_ {
  uint32_t _has_storage_[1];
  NSString *message;
  NSString *code;
  NSString *details;
} ProtosError__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "message",
        .dataTypeSpecific.className = NULL,
        .number = ProtosError_FieldNumber_Message,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosError__storage_, message),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = ProtosError_FieldNumber_Code,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ProtosError__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "details",
        .dataTypeSpecific.className = NULL,
        .number = ProtosError_FieldNumber_Details,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ProtosError__storage_, details),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosError class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosError__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ProtosResult

@implementation ProtosResult

@dynamic shouldBeEmpty;
@dynamic type;
@dynamic value;
@dynamic hasValuebytes, valuebytes;

typedef struct ProtosResult__storage_ {
  uint32_t _has_storage_[1];
  NSString *value;
  GPBAny *valuebytes;
} ProtosResult__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = ProtosResult_FieldNumber_Type,
        .hasIndex = 2,
        .offset = 3,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = ProtosResult_FieldNumber_Value,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(ProtosResult__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "valuebytes",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBAny),
        .number = ProtosResult_FieldNumber_Valuebytes,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(ProtosResult__storage_, valuebytes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "shouldBeEmpty",
        .dataTypeSpecific.className = NULL,
        .number = ProtosResult_FieldNumber_ShouldBeEmpty,
        .hasIndex = 0,
        .offset = 1,  // Stored in _has_storage_ to save space.
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosResult class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosResult__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\004\r\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ProtosPayload

@implementation ProtosPayload

@dynamic hasResult, result;
@dynamic hasError, error;

typedef struct ProtosPayload__storage_ {
  uint32_t _has_storage_[1];
  ProtosResult *result;
  ProtosError *error;
} ProtosPayload__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "result",
        .dataTypeSpecific.className = GPBStringifySymbol(ProtosResult),
        .number = ProtosPayload_FieldNumber_Result,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosPayload__storage_, result),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "error",
        .dataTypeSpecific.className = GPBStringifySymbol(ProtosError),
        .number = ProtosPayload_FieldNumber_Error,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ProtosPayload__storage_, error),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosPayload class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosPayload__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ProtosGeneric

@implementation ProtosGeneric

@dynamic data_p;

typedef struct ProtosGeneric__storage_ {
  uint32_t _has_storage_[1];
  NSString *data_p;
} ProtosGeneric__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "data_p",
        .dataTypeSpecific.className = NULL,
        .number = ProtosGeneric_FieldNumber_Data_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosGeneric__storage_, data_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosGeneric class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosGeneric__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ProtosMirrorMethodCall

@implementation ProtosMirrorMethodCall

@dynamic method;
@dynamic hasArguments, arguments;

typedef struct ProtosMirrorMethodCall__storage_ {
  uint32_t _has_storage_[1];
  NSString *method;
  GPBAny *arguments;
} ProtosMirrorMethodCall__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "method",
        .dataTypeSpecific.className = NULL,
        .number = ProtosMirrorMethodCall_FieldNumber_Method,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosMirrorMethodCall__storage_, method),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "arguments",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBAny),
        .number = ProtosMirrorMethodCall_FieldNumber_Arguments,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ProtosMirrorMethodCall__storage_, arguments),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosMirrorMethodCall class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosMirrorMethodCall__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ProtosMessage

@implementation ProtosMessage

@dynamic hasHeader, header;
@dynamic hasPayload, payload;
@dynamic hasMethodCall, methodCall;

typedef struct ProtosMessage__storage_ {
  uint32_t _has_storage_[1];
  ProtosHeader *header;
  ProtosPayload *payload;
  ProtosMirrorMethodCall *methodCall;
} ProtosMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "header",
        .dataTypeSpecific.className = GPBStringifySymbol(ProtosHeader),
        .number = ProtosMessage_FieldNumber_Header,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ProtosMessage__storage_, header),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "payload",
        .dataTypeSpecific.className = GPBStringifySymbol(ProtosPayload),
        .number = ProtosMessage_FieldNumber_Payload,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ProtosMessage__storage_, payload),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "methodCall",
        .dataTypeSpecific.className = GPBStringifySymbol(ProtosMirrorMethodCall),
        .number = ProtosMessage_FieldNumber_MethodCall,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ProtosMessage__storage_, methodCall),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ProtosMessage class]
                                     rootClass:[ProtosMessageRoot class]
                                          file:ProtosMessageRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ProtosMessage__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
