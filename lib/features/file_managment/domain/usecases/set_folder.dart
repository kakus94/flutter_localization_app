import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class SetFolder {
  final FileRepository repository;
  SetFolder(this.repository);

  void call(String path) => repository.selectFolder(path);
}
