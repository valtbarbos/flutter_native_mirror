// ignore_for_file: unnecessary_string_interpolations

part of './models.devicekit.dart';

extension ResultX on Result {
  bool isEmpty() {
    return !valuebytes.hasValue();
  }

  bool isInvalid() {
    return isEmpty() && !shouldBeEmpty;
  }
}

extension MessageX on Message {
  //

  bool hasReportedErrors() {
    return error.code.isNotEmpty;
  }

  bool isEmptyResult() => result.shouldBeEmpty;

  Future<Result> validation() async {
    if (result.isInvalid()) {
      throw PlatformException(
        code: 'connection-playload-invalid',
        message: 'Please, check our entrypoint container.',
        details: null,
      );
    } else if (hasReportedErrors()) {
      throw PlatformException(
        code: error.code,
        message: error.message,
        details: error.details,
      );
    } else {
      return result;
    }
  }
}
