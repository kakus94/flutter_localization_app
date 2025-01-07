import 'dart:io';

import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/utils/utils.dart';
import 'package:flutter_localization_app/features/file_managment/data/datasources/data_file.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

import '../../../../core/error/failures_imp.dart';

class FileRepositoryImp implements FileRepository {
  final DataFile dataFile = DataFile();

  @override
  FutureApp<String> getFile(String path) {
    throw UnimplementedError();
  }

  @override
  FutureApp<void> selectFolder(String? path) async {
    final directory = dataFile.selectDirectory(path);
    return RightApp(directory);
  }

  @override
  FutureApp<List<FileSystemEntity>> getFiles() async {
    final directory = dataFile.selectedDirectory;
    if (directory == null) {
      return RightApp([]);
    }

    final result = directory
        .listSync(recursive: false)
        .where((e) => e.path.contains('localization_'))
        .toList();

    return RightApp(result);
  }

  @override
  FutureApp<void> createUpdateFile(String lang, String content) {
    final fileName = Utils.fileName(lang: lang);
    final directory = dataFile.selectedDirectoryPath;
    final file = File('$directory/$fileName');
    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsStringSync(content);

    return Future.value(RightApp(null));
  }

  @override
  FutureApp<void> deleteFile(String path) {
    final file = File(path);
    if (file.existsSync()) {
      file.deleteSync();
      return Future.value(RightApp(null));
    }
    return Future.value(LeftApp(FileNotFoundFailure()));
  }
}
