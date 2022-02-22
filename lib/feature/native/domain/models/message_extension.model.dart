// ignore_for_file: unnecessary_string_interpolations

part of './models.devicekit.dart';

extension PayloadX on Payload {
  bool isEmpty() {
    return !valuebytes.hasValue();
  }
}

extension MessageX on Message {
  //

  bool hasReportedErrors() {
    return error.code.isNotEmpty;
  }

  bool isEmptyResult() => payload.isEmpty();

  Future<Payload> validation() async {
    if (hasReportedErrors()) {
      throw PlatformException(
        code: error.code,
        message: error.message,
        details: error.details,
      );
    } else {
      return payload;
    }
  }
}
