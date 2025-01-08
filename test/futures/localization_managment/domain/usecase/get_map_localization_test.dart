import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/usecases/get_map_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mock.mocks.dart';

void main() async {
//testowanie get_map_localization
//zaleznosc z Repository
  group('get_map_localization', () {
    late LocalizationRepository repository;
    late GetMapLocalization getMapLocalization;

    final expectResult = RightApp<Map<String, List<LocalizationEntity>>>({
      'pl': [
        LocalizationEntity(
            keyValue: '1',
            value: 'value',
            description: 'description',
            placeholders: {}),
        LocalizationEntity(
            keyValue: '2',
            value: 'value2',
            description: 'description2',
            placeholders: {})
      ]
    });

    setUp(() {
      repository = MockLocalizationRepository();
      getMapLocalization = GetMapLocalization(repository);
    });

    test('should return map localization when repository call is successful',
        () async {
      //arrange
      when(repository.getMapLocalization())
          .thenAnswer((_) async => expectResult);
      //act
      final result = await getMapLocalization.call();
      //assert
      expect(result, expectResult);
    });

    test('should throw an exception when repository throws an exception',
        () async {
      //arrange
      when(repository.getMapLocalization()).thenThrow(Exception());
      //act and assert
      expect(() async => await getMapLocalization.call(), throwsException);
    });
    test('should return an empty list when repository returns an empty list',
        () async {
      //Oczekiwane
      final expectResult = RightApp<Map<String, List<LocalizationEntity>>>({});
      //arrange
      when(repository.getMapLocalization())
          .thenAnswer((_) async => expectResult);
      //act
      final result = await getMapLocalization.call();
      //assert
      expect(result, expectResult);
    });
  });
}
