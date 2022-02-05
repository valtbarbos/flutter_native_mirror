# Rules:

you must not change the tag numbers of any existing fields. 
you may delete fields. 
you may add new fields but you must use fresh tag numbers (i.e. tag numbers that were never used in this protocol buffer, not even by deleted fields). 

# Exceptions rules: https://developers.google.com/protocol-buffers/docs/proto3#updating


##
##

# Generate protobuf files in Dart
1. If upgrading, delete all proto files from /home/.pub-cache/bin
1. Clone the latest dart-protoc-plugin from https://github.com/dart-lang/protobuf
1. Run `pub install` inside protobuf/protoc_plugin
1. Run `pub global activate protoc_plugin` to get .dart files into /home/.pub-cache/bin/
1. Get the latest linux protoc compiler from https://github.com/google/protobuf/releases/ (protoc-X.X.X-linux-x86_64.zip)
1. Copy /bin/protoc into /home/.pub-cache/bin/
1. Run the following commands from this project's protos folder
```protoc --dart_out=../lib/gen ./flutterblue.proto```
```protoc --objc_out=../ios/gen ./flutterblue.proto```

##
##



# FROM INSIDE OF [.proto] files folder:

# 1 generate from [.proto] file

protoc \
--proto_path=./ \
--dart_out=./lib/feature/native/domain/views/generated \
./lib/feature/native/domain/views/proto/message.proto

# protoc bug:
(cd ./lib/feature/native/domain/views/ && \
protoc \
--dart_out=../../../../..//lib/feature/native/domain/views/generated/ \
./proto/message.proto)

./proto/*.proto)
# optional [generate_kythe_info]

protoc --dart_out=generate_kythe_info:./generated ./proto/*.proto

# 2 generate [timestamp.proto] dependency

protoc \
    --dart_out=grpc:./generated \
    -I./ \
    -I./ ./ google/protobuf/timestamp.proto


# optional [generate_kythe_info]

protoc \
--dart_out="generate_kythe_info,grpc:./generated" \
-I./ \
-I./ ./ google/protobuf/timestamp.proto

# 3 - Generate Android classes:

# folder FROM inner path:

../../../../../android/src/main/java/com/medm/devicekit/flutter_native_mirror/

# OBS: -- android only -- [package viewmodels], defined in [.proto] files
# will create a folder with this [package name]

[*.proto or message.proto]

protoc \
--proto_path=./ \
--java_out=./android/src/main/java/ \
./lib/feature/native/domain/views/proto/message.proto

# iOS:

[*.proto or message.proto]

protoc \
--proto_path=./ \
--objc_out=./ios/ \
./lib/feature/native/domain/views/proto/message.proto
<!-- flutter_native_mirror/lib/feature/native/domain/views -->

# iOS bug:
(cd ./lib/feature/native/domain/views/ && \
protoc \
--objc_out=../../../../../ios/ \
./proto/*.proto)

# COMB

(cd ./lib/feature/native/domain/views/ && \
protoc \
--dart_out=../../../../../lib/feature/native/domain/views/generated/ \
./proto/message.proto) && \
(cd ./lib/feature/native/domain/views/ && \
protoc \
--objc_out=../../../../../ios/ \
./proto/message.proto) && \
protoc \
--proto_path=./ \
--java_out=./android/src/main/java/ \
./lib/feature/native/domain/views/proto/message.proto


# Example

(cd ./lib/feature/native/domain/views/ && \
protoc \
--dart_out=../../../../../lib/feature/native/domain/views/generated/ \
./proto/message.proto) && \
(cd ./lib/feature/native/domain/views/ && \
protoc \
--objc_out=../../../../../ios/ \
./proto/message.proto) && \
protoc \
--proto_path=./ \
--java_out=./android/src/main/java/ \
./lib/feature/native/domain/views/proto/message.proto