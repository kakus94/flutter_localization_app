// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  LocalizationEntity copyWith({
    String? keyValue,
    String? value,
    String? description,
    Map<String, dynamic>? placeholders,
  }) {
    return LocalizationEntity(
      keyValue: keyValue ?? this.keyValue,
      value: value ?? this.value,
      description: description ?? this.description,
      placeholders: placeholders ?? this.placeholders,
    );
  }
}
