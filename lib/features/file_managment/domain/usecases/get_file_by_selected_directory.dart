import 'dart:io';

import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class GetFileBySelectedDirectory {
  FileRepository repository;

  GetFileBySelectedDirectory(this.repository);

  FutureApp<List<FileSystemEntity>> call() {
    return repository.getFiles();
  }
}
