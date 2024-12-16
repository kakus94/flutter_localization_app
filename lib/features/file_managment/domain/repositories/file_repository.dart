import 'dart:io';

abstract class FileRepository {
  Future<String> getFile(String path);
  Future<void> selectFolder(String? path);
  Future<List<FileSystemEntity>> getFiles();
}
