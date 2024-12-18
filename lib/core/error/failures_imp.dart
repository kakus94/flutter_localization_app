import 'package:flutter_localization_app/core/error/failures.dart';

class FileReadFailure extends Failure {
  const FileReadFailure() : super(code: 1001, desc: 'File read failure');
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure() : super(code: 1000, desc: 'File not found');
}
