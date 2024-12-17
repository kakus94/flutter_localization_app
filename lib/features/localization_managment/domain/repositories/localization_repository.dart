import 'package:flutter_localization_app/core/type/typedef.dart';

abstract class LocalizationRepository {
  FutureApp<Map<String, dynamic>> getMapLocalizationByLang(String lang);
  FutureApp<Map<String, Map<String, dynamic>>> getMapLocalization();
}
