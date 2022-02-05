part of './environment.devicekit.dart';

class NativeCommunicationMetadata {
  // ignore: non_constant_identifier_names
  static String TAG = 'FlutterNativeMirrorInstance';
  static String scheme = 'com.medm.just_ble';
  static String platformMethodChannel = scheme + '.methods';
  static String hostEventChannel = scheme + '.events';
  static String businessNamespace =
      // 'br.com.alvertabbaros.flutter_medm_devicekit.business.BusinessMethods';
      'br.com.alvertabbaros.flutter_native_mirror_example.business.BusinessMethods';
}
