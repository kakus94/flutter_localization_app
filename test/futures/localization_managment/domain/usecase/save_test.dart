import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/usecases/save.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mock.mocks.dart';

void main() async {
//testowanie get_map_localization
//zaleznosc z Repository
  group('get_map_localization', () {
    late LocalizationRepository repository;
    late Save save;

    setUp(() {
      repository = MockLocalizationRepository();
      save = Save(repository);
    });

    test('should return map localization when repository call is successful',
        () async {
      //arrange
      when(repository.saveEntity(entities: [], lang: ''))
          .thenAnswer((_) async => RightApp<void>(null));
      //act
      final result = await save(Params(entities: [], lang: ''));
      //assert
      expect(result, RightApp<void>(null));
    });

    test('should throw an exception when repository throws an exception',
        () async {
      //arrange
      when(repository.saveEntity(entities: [], lang: ''))
          .thenThrow(Exception());
      //act and assert
      expect(() async => await save(Params(entities: [], lang: '')),
          throwsException);
    });
  });
}
