import 'dart:io';

import 'package:flutter_localization_app/features/file_managment/data/datasources/data_file.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class AppFileRepository implements FileRepository {
  final DataFile dataFile = DataFile();

  @override
  Future<String> getFile(String path) {
    // TODO: implement getFile
    throw UnimplementedError();
  }

  @override
  Future<void> selectFolder(String? path) async {
    dataFile.selectDirectory(path);
  }

  @override
  Future<List<FileSystemEntity>> getFiles() async {
    final directory = dataFile.getDirectory;
    if (directory == null) {
      return [];
    }

    return directory
        .listSync(recursive: false)
        .where((e) => e.path.contains('localization_'))
        .toList();
  }
}
