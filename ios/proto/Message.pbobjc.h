// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: proto/message.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class GPBAny;
@class ProtosError;
@class ProtosHeader;
@class ProtosMirrorMethodCall;
@class ProtosPayload;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum ProtosHeader_CommunicationType

typedef GPB_ENUM(ProtosHeader_CommunicationType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  ProtosHeader_CommunicationType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  ProtosHeader_CommunicationType_Setup = 0,
  ProtosHeader_CommunicationType_Cancelation = 1,
};

GPBEnumDescriptor *ProtosHeader_CommunicationType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL ProtosHeader_CommunicationType_IsValidValue(int32_t value);

#pragma mark - ProtosMessageRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface ProtosMessageRoot : GPBRootObject
@end

#pragma mark - ProtosHeader

typedef GPB_ENUM(ProtosHeader_FieldNumber) {
  ProtosHeader_FieldNumber_Id_p = 1,
  ProtosHeader_FieldNumber_Namespace_p = 2,
  ProtosHeader_FieldNumber_TargetMethod = 3,
  ProtosHeader_FieldNumber_Intent = 4,
  ProtosHeader_FieldNumber_PlatformCallBackMethodHandler = 6,
  ProtosHeader_FieldNumber_TargetMethodCancellation = 7,
  ProtosHeader_FieldNumber_CallBackReferenceId = 8,
};

@interface ProtosHeader : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *namespace_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *targetMethod;

@property(nonatomic, readwrite, copy, null_resettable) NSString *targetMethodCancellation;

@property(nonatomic, readwrite, copy, null_resettable) NSString *platformCallBackMethodHandler;

@property(nonatomic, readwrite) int32_t callBackReferenceId;

@property(nonatomic, readwrite) ProtosHeader_CommunicationType intent;

@end

/**
 * Fetches the raw value of a @c ProtosHeader's @c intent property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t ProtosHeader_Intent_RawValue(ProtosHeader *message);
/**
 * Sets the raw value of an @c ProtosHeader's @c intent property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetProtosHeader_Intent_RawValue(ProtosHeader *message, int32_t value);

#pragma mark - ProtosError

typedef GPB_ENUM(ProtosError_FieldNumber) {
  ProtosError_FieldNumber_Message = 1,
  ProtosError_FieldNumber_Code = 2,
  ProtosError_FieldNumber_Details = 3,
};

@interface ProtosError : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@property(nonatomic, readwrite, copy, null_resettable) NSString *code;

@property(nonatomic, readwrite, copy, null_resettable) NSString *details;

@end

#pragma mark - ProtosPayload

typedef GPB_ENUM(ProtosPayload_FieldNumber) {
  ProtosPayload_FieldNumber_Valuebytes = 3,
};

@interface ProtosPayload : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) GPBAny *valuebytes;
/** Test to see if @c valuebytes has been set. */
@property(nonatomic, readwrite) BOOL hasValuebytes;

@end

#pragma mark - ProtosGeneric

typedef GPB_ENUM(ProtosGeneric_FieldNumber) {
  ProtosGeneric_FieldNumber_Data_p = 1,
};

@interface ProtosGeneric : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *data_p;

@end

#pragma mark - ProtosMirrorMethodCall

typedef GPB_ENUM(ProtosMirrorMethodCall_FieldNumber) {
  ProtosMirrorMethodCall_FieldNumber_Method = 1,
  ProtosMirrorMethodCall_FieldNumber_Arguments = 2,
};

@interface ProtosMirrorMethodCall : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *method;

@property(nonatomic, readwrite, strong, null_resettable) GPBAny *arguments;
/** Test to see if @c arguments has been set. */
@property(nonatomic, readwrite) BOOL hasArguments;

@end

#pragma mark - ProtosMessage

typedef GPB_ENUM(ProtosMessage_FieldNumber) {
  ProtosMessage_FieldNumber_Header = 1,
  ProtosMessage_FieldNumber_Payload = 2,
  ProtosMessage_FieldNumber_Error = 3,
  ProtosMessage_FieldNumber_MethodCall = 4,
};

@interface ProtosMessage : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) ProtosHeader *header;
/** Test to see if @c header has been set. */
@property(nonatomic, readwrite) BOOL hasHeader;

@property(nonatomic, readwrite, strong, null_resettable) ProtosPayload *payload;
/** Test to see if @c payload has been set. */
@property(nonatomic, readwrite) BOOL hasPayload;

@property(nonatomic, readwrite, strong, null_resettable) ProtosError *error;
/** Test to see if @c error has been set. */
@property(nonatomic, readwrite) BOOL hasError;

@property(nonatomic, readwrite, strong, null_resettable) ProtosMirrorMethodCall *methodCall;
/** Test to see if @c methodCall has been set. */
@property(nonatomic, readwrite) BOOL hasMethodCall;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
