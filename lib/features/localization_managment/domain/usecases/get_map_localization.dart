import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';

class GetMapLocalization {
  final LocalizationRepository repository;

  GetMapLocalization(this.repository);

  FutureApp<Map<String, List<LocalizationEntity>>> call() {
    return repository.getMapLocalization();
  }
}
