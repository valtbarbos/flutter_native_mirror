# pigeon

mkdir ./ios/pigeon \
mkdir ./android/src/main/java/com/medm/devicekit/flutter_native_mirror/pigeon 

flutter pub run pigeon \
  --input lib/feature/native/domain/interfaces/i_pigeon.service.interface.dart \
  --dart_out lib/feature/native/infrastructure/services/pigeon.service.dart \
  --objc_header_out ios/pigeon/NativeApi.h \
  --objc_source_out ios/pigeon/NativeApi.m \
  --java_out ./android/src/main/java/com/medm/devicekit/flutter_native_mirror/pigeon/NativeApi.java
  --java_package "br.com.alvertabbaros.flutter_native_mirror"