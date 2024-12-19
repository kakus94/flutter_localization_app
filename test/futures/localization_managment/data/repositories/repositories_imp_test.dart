import 'dart:convert';

import 'package:flutter_localization_app/core/error/failures_imp.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/data/models/localization_model.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/data/repositories/repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mock.mocks.dart';
import '../../../../utils/utils.dart';

void main() async {
//Test dla warstwy data dla repository file
  group('File Repository', () {
    late FileRepository repository;
    late RepositoryImp repositoryImp;

    setUp(() {
      repository = MockFileRepository();
      repositoryImp = RepositoryImp(fileRepository: repository);
    });

    test('should return list of files', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final content = await Utils.readAsset(Lang.pl);
      final expectResult = RightApp(content);

      //arrange
      when(repository.getFiles()).thenAnswer((_) async => Utils.getFiles());
      //act
      final result = await repositoryImp.getMapLocalizationByLang('pl');
      //assert
      expect(result.isRight(), expectResult.isRight());
      expect(
        result.getOrElse(() => {}),
        equals(expectResult.getOrElse(() => {})),
      );
    });

    test('should throw an exception when repository throws an exception',
        () async {
      // arrange
      when(repository.getFiles())
          .thenAnswer((_) async => LeftApp(FileNotFoundFailure()));
      // act
      final result = await repositoryImp.getMapLocalizationByLang('pl');
      // assert
      expect(result.isLeft(), true);
    });
  });
}
