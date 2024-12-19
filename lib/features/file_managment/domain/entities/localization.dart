import 'package:equatable/equatable.dart';

class LocalizationEntity extends Equatable {
  final String keyValue;
  final String value;
  final String description;
  final Map<String, dynamic> placeholders;

  const LocalizationEntity({
    required this.keyValue,
    required this.value,
    required this.description,
    required this.placeholders,
  });

  @override
  List<Object?> get props => [keyValue, value, description, placeholders];
}


/*
"extensions_sensor_data": "Temperatura: {temperature}°C, wilgotność: {humidity}%",
  "@extensions_sensor_data": {
    "description": "Temperatura i wilgotność na ekranie rozszerzeń",
    "placeholders": {
      "temperature": {
        "type": "String",
        "example": "22,5"
      },
      "humidity": {
        "type": "String",
        "example": "65"
      }
    }
  }
*/