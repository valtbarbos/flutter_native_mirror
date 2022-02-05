#import "FlutterNativeMirrorPlugin.h"

@implementation FlutterNativeMirrorPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {

  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_native_mirror"
            binaryMessenger:[registrar messenger]];
  
  FlutterNativeMirrorPlugin* instance = [[FlutterNativeMirrorPlugin alloc] init];
  
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
  
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  
  } else {
  
    result(FlutterMethodNotImplemented);
  
  }
}

@end
