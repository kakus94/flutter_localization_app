import 'dart:convert';

import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';

class LocalizationModel extends LocalizationEntity {
  const LocalizationModel({
    required super.keyValue,
    required super.value,
    required super.description,
    required super.placeholders,
  });

  // Konwersja do formatu JSON
  String convertToString() {
    final place = json.encode(placeholders);
    return '"$keyValue":"$value","@$keyValue":{"description":"$description","placeholders":$place}';
  }

  static List<LocalizationEntity> parseLocalizationEntities(String jsonString) {
    // Dekodowanie JSON do mapy
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final List<LocalizationEntity> entities = [];

    // Iteracja po kluczach JSON
    jsonMap.forEach((key, value) {
      // Sprawdź, czy klucz to wartość (np. `extensions_sensor_data`)
      // oraz czy istnieje klucz opisowy (np. `@extensions_sensor_data`)
      if (!key.startsWith('@')) {
        final descriptionKey = '@$key';
        final descriptionObject =
            jsonMap[descriptionKey] as Map<String, dynamic>?;

        final description = descriptionObject?['description'] ?? '';
        final placeholders = descriptionObject?['placeholders'] ?? {};

        // Dodaj do listy obiekt `LocalizationEntity`
        entities.add(
          LocalizationEntity(
            keyValue: key,
            value: value as String,
            description: description,
            placeholders: placeholders as Map<String, dynamic>,
          ),
        );
      }
    });

    return entities;
  }
}
