import 'dart:io';

import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class GetFileBySelectedDirectory {
  FileRepository repository;

  GetFileBySelectedDirectory(this.repository);

  Future<List<FileSystemEntity>> call() {
    return repository.getFiles();
  }
}
