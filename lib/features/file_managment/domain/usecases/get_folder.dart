import 'package:flutter_localization_app/core/type/typedef.dart';

import '../repositories/file_repository.dart';

class GetFolder {
  final FileRepository repository;

  GetFolder(this.repository);

  FutureApp<String> call(String path) {
    return repository.getFile(path);
  }
}
