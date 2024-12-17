import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';

class GetMapLocalizationByLang {
  final LocalizationRepository repository;

  GetMapLocalizationByLang(this.repository);

  FutureApp<Map<String, dynamic>> call(String s) {
    return repository.getMapLocalizationByLang(s);
  }
}
