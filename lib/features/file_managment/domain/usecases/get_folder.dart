import '../repositories/file_repository.dart';

class GetFolder {
  final FileRepository repository;

  GetFolder(this.repository);

  Future<String> call(String path) {
    return repository.getFile(path);
  }
}
