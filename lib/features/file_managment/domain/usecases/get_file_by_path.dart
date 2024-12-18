import 'dart:io';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class GetFileByPath {
  final FileRepository repository;
  GetFileByPath(this.repository);

  FutureApp<List<FileSystemEntity>> call(String path) => repository.getFiles();
}
