import 'package:flutter_localization_app/core/config/config.dart';

class Utils {
  static String fileName({required String lang}) {
    return '$prefixFileName$lang$suffixFileName';
  }
}
