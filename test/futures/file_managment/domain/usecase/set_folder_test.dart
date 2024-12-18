import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_localization_app/features/file_managment/domain/usecases/get_folder.dart';

import 'get_folder_test.mocks.dart';

void main() {
  late GetFolder getFolder;
  late MockFileRepository mockFileRepository;

  setUp(() {
    mockFileRepository = MockFileRepository();
    getFolder = GetFolder(mockFileRepository);
  });

  test('should return file content when repository call is successful',
      () async {
    final expectResult = RightApp<String>('final answer');
    // arrange
    when(mockFileRepository.getFile('any'))
        .thenAnswer((_) async => expectResult);
    // act
    final result = await getFolder.call('any');
    // assert
    expect(result, expectResult);
  });

  test('should throw an exception when repository call fails', () async {
    // arrange
    when(mockFileRepository.getFile('any'))
        .thenThrow(Exception('Failed to get file'));
    // act and assert
    expect(() async => await getFolder.call('any'), throwsException);
  });
}
