import 'dart:io';

import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/file_managment/domain/usecases/get_file_by_path.dart';

class GetFileBySelectedDirectory
    implements UseCase<List<FileSystemEntity>, NoParams> {
  FileRepository repository;

  GetFileBySelectedDirectory(this.repository);

  @override
  FutureApp<List<FileSystemEntity>> call(NoParams noParams) {
    return repository.getFiles();
  }
}
