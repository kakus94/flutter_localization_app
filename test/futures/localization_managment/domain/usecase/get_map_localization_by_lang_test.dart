import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/usecases/get_map_localization_by_lang.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mock.mocks.dart';

void main() async {
  group('testing usecase get_map_localization_by_lang -', () {
    late LocalizationRepository repository;
    late GetMapLocalizationByLang getMapLocalizationByLang;

    final expectResult = RightApp({'any': 'any'});

    setUp(() {
      repository = MockLocalizationRepository();
      getMapLocalizationByLang = GetMapLocalizationByLang(repository);
    });

    test('should return map localization when repository call is successful',
        () async {
      //arrange
      when(repository.getMapLocalizationByLang('any'))
          .thenAnswer((_) async => expectResult);
      //act
      final result = await getMapLocalizationByLang('any');
      //assert
      expect(result, expectResult);
    });
    test('should throw an exception when repository throws an exception',
        () async {
      //arrange
      when(repository.getMapLocalizationByLang('any')).thenThrow(Exception());
      //act and assert
      expect(
          () async => await getMapLocalizationByLang('any'), throwsException);
    });
    test('should return an empty list when repository returns an empty list',
        () async {
      final tValue = RightApp<Map<String, dynamic>>({});
      //arrange
      when(repository.getMapLocalizationByLang('any'))
          .thenAnswer((_) async => tValue);
      //act
      final result = await getMapLocalizationByLang('any');
      //assert
      expect(result, tValue);
    });
  });
}
