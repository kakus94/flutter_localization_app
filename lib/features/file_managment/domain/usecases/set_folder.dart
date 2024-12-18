import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class SetFolder implements UseCase<void, Params> {
  final FileRepository repository;
  SetFolder(this.repository);

  @override
  FutureApp<void> call(Params params) => repository.selectFolder(params.path);
}

class Params extends Equatable {
  final String path;
  const Params({required this.path});
  @override
  List<Object?> get props => [path];
}
