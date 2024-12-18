import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';

import '../repositories/file_repository.dart';

class GetFolder implements UseCase<String, Params> {
  final FileRepository repository;

  GetFolder(this.repository);

  @override
  FutureApp<String> call(Params params) {
    return repository.getFile(params.path);
  }
}

class Params extends Equatable {
  final String path;
  const Params({required this.path});

  @override
  List<Object?> get props => [path];
}
