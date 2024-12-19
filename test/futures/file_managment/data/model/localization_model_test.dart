import 'dart:convert';

import 'package:flutter_localization_app/core/extension/list_to_one_json_convert.dart';
import 'package:flutter_localization_app/features/file_managment/data/models/localization_model.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../../../../fixtures/localization_mock.dart';

void main() {
  test('should be a subclass of Localization entity', () async {
    final tLocalizationModel = LocalizationModel(
      keyValue: 'key',
      value: 'value',
      description: 'description',
      placeholders: {},
    );
    expect(tLocalizationModel, isA<LocalizationEntity>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      //arrange
      final String jsonMap = fixture('localization_mock.json');

      //act
      final results = LocalizationModel.parseLocalizationEntities(jsonMap);
      //assert
      expect(results.length, 3);
      expect(results[0].keyValue, equals(localizationMock[0].keyValue));
      expect(results[0].value, equals(localizationMock[0].value));
      expect(results[0].description, equals(localizationMock[0].description));
      expect(results[0].placeholders, equals(localizationMock[0].placeholders));
      expect(results[1].keyValue, equals(localizationMock[1].keyValue));
      expect(results[1].value, equals(localizationMock[1].value));
      expect(results[1].description, equals(localizationMock[1].description));
      expect(results[1].placeholders, equals(localizationMock[1].placeholders));
      expect(results[2].keyValue, equals(localizationMock[2].keyValue));
      expect(results[2].value, equals(localizationMock[2].value));
      expect(results[2].description, equals(localizationMock[2].description));
      expect(results[2].placeholders, equals(localizationMock[2].placeholders));
    });

    test('should return valid json map', () async {
      // final converToJson = ListToOneJsonConvert();
      //arrange
      final result = localizationMock
          .map((e) => e.convertToString())
          .toList()
          .toOneJsonString();
      //act
      final jsonMap = fixture('localization_mock.json');
      final xx = JsonDecoder().convert(jsonMap);
      final yy = JsonEncoder().convert(xx);

      //assert
      expect(result, equals(yy));
    });
  });
}
