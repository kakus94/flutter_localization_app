import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart'
    as repo;
import 'package:flutter_localization_app/features/file_managment/domain/usecases/get_folder.dart'
    as usecase;
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_folder_test.mocks.dart';

@GenerateMocks([repo.FileRepository])
void main() {
  late repo.FileRepository fileRepository;
  late usecase.GetFolder getFolder;

  setUp(() {
    fileRepository = MockFileRepository();
    getFolder = usecase.GetFolder(fileRepository);
  });

  test("should return file content when repository call is successful",
      () async {
    //arrange
    when(fileRepository.getFile('any'))
        .thenAnswer((realInvocation) async => 'final answer');
    //act
    final result = await getFolder.call('any');
    //assert
    expect(result, 'final answer');
  });
}
