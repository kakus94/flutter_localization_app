import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/usecase/usecase.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';

class Save implements UseCase<void, Params> {
  final LocalizationRepository repository;

  Save(this.repository);

  @override
  FutureApp<void> call(Params params) {
    return repository.saveEntity(
      entities: params.entities,
      lang: params.lang,
    );
  }
}

class Params extends Equatable {
  final List<LocalizationEntity> entities;
  final String lang;

  const Params({required this.entities, required this.lang});

  @override
  List<Object?> get props => [entities, lang];
}
