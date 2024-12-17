import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/data/repositories/repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecase/get_folder_test.mocks.dart';

@GenerateMocks([FileRepository])
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
      //arrange
      when(repository.getFiles()).thenAnswer((_) async => []);
      //act
      final result = await repositoryImp.getMapLocalizationByLang('any');
      //assert
      expect(result, []);
    });

    test('should throw an exception when repository throws an exception',
        () async {});

    test('should return an empty list when repository returns an empty list',
        () async {});
  });
}
