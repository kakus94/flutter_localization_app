import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class CreateUpdateFile implements UseCase<void, Params> {
  final FileRepository fileRepository;

  CreateUpdateFile(this.fileRepository);

  @override
  FutureApp<void> call(Params params) {
    return fileRepository.createUpdateFile(params.lang, params.content);
  }
}

class Params extends Equatable {
  final String lang;
  final String content;

  const Params({required this.lang, required this.content});

  @override
  List<Object?> get props => [lang, content];
}
