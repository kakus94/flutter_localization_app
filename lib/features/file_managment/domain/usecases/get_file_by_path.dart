import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

class GetFileByPath implements UseCase<List<FileSystemEntity>, NoParams> {
  final FileRepository repository;
  GetFileByPath(this.repository);

  @override
  FutureApp<List<FileSystemEntity>> call(NoParams noParams) {
    return repository.getFiles();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
