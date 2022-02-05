// ignore_for_file: unnecessary_string_interpolations

part of './models.devicekit.dart';

extension PayloadX on Payload {
  bool isInvalid() {
    return error.code.isEmpty && result.value.isEmpty;
  }

  bool hasReportedErrors() {
    return error.code.isNotEmpty;
  }
}

extension MessageX on Message {
  //
  Future<Result> validation() async {
    final payload = this.payload;

    if (payload.isInvalid()) {
      throw PlatformException(
        code: 'connection-playload-invalid',
        message: 'Please, check our entrypoint container.',
        details: null,
      );
    } else if (payload.hasReportedErrors()) {
      throw PlatformException(
        code: payload.error.code,
        message: payload.error.message,
        details: payload.error.details,
      );
    } else {
      return payload.result;
    }
  }
}
