import 'package:flutter_localization_app/features/file_managment/data/models/localization_model.dart';

const List<LocalizationModel> localizationMock = [
  LocalizationModel(
    keyValue: 'extensions_sensor_data',
    value: 'Temperatura: {temperature}°C, wilgotność: {humidity}%',
    description: 'Temperatura i wilgotność na ekranie rozszerzeń',
    placeholders: {
      "temperature": {"type": "String", "example": "22,5"},
      "humidity": {"type": "String", "example": "65"}
    },
  ),
  LocalizationModel(
    keyValue: 'extensions_confirm_unpair_message',
    value: 'Czy chcesz usunąć urządzenie {deviceName}?',
    description: 'Komunikat potwierdzający usunięcie urządzenia',
    placeholders: {
      "deviceName": {"type": "String", "example": "Listwa grzejna 1"}
    },
  ),
  LocalizationModel(
    keyValue: 'extensions_confirm_unpair_title',
    value: 'Usuwanie urządzenia',
    description: 'Tytuł potwierdzający usunięcie urządzenia',
    placeholders: {},
  ),
];
