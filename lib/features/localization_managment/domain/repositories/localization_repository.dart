import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';

abstract class LocalizationRepository {
  FutureApp<Map<String, dynamic>> getMapLocalizationByLang(String lang);
  FutureApp<Map<String, Map<String, dynamic>>> getMapLocalization();
  FutureApp<void> saveEntity({
    required List<LocalizationEntity> entities,
    required String lang,
  });
}
