import 'package:equatable/equatable.dart';

class LocalizationEntity extends Equatable {
  final String keyValue;
  final String value;
  final String description;
  final String type;
  final Map<String, dynamic> placeholders;

  const LocalizationEntity({
    required this.keyValue,
    required this.value,
    required this.description,
    required this.type,
    required this.placeholders,
  });

  @override
  List<Object?> get props => [keyValue, value, description, placeholders, type];
}
