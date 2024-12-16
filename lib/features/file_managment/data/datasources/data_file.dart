import 'dart:io';

class DataFile {
  String? _selectedDirectoryPath;
  Directory? _selectedDirectory;

  DataFile();

  void selectDirectory(String? path) {
    if (path == null) {
      _selectedDirectoryPath = null;
      _selectedDirectory = null;
      return;
    }

    _selectedDirectoryPath = path;
    _selectedDirectory = Directory(path);
  }

  String? get selectedDirectoryPath => _selectedDirectoryPath;
  Directory? get selectedDirectory => _selectedDirectory;
}
