import 'dart:io';

import 'package:flutter_localization_app/core/type/typedef.dart';

abstract class FileRepository {
  FutureApp<String> getFile(String path);
  FutureApp<void> selectFolder(String? path);
  FutureApp<List<FileSystemEntity>> getFiles();
  FutureApp<void> createUpdateFile(String lang, String content);
  FutureApp<void> deleteFile(String path);
}
