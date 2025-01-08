// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class LocalizationEntity extends Equatable {
  final String? uuid;
  final String keyValue;
  final String value;
  final String description;
  final Map<String, dynamic> placeholders;

  const LocalizationEntity({
    required this.uuid,
    required this.keyValue,
    required this.value,
    required this.description,
    required this.placeholders,
  });

  factory LocalizationEntity.uuidv4({
    String? uuid,
    String? keyValue,
    String? value,
    String? description,
    Map<String, dynamic>? placeholders,
  }) {
    return LocalizationEntity(
      uuid: uuid ?? Uuid().v4(),
      keyValue: keyValue ?? '',
      value: value ?? '',
      description: description ?? '',
      placeholders: placeholders ?? {},
    );
  }

  @override
  List<Object?> get props => [keyValue, value, description, placeholders];

  LocalizationEntity copyWith({
    String? uuid,
    String? keyValue,
    String? value,
    String? description,
    Map<String, dynamic>? placeholders,
  }) {
    return LocalizationEntity(
      uuid: uuid ?? this.uuid,
      keyValue: keyValue ?? this.keyValue,
      value: value ?? this.value,
      description: description ?? this.description,
      placeholders: placeholders ?? this.placeholders,
    );
  }
}
