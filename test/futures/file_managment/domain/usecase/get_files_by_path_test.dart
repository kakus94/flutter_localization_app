import 'dart:io';

import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/features/file_managment/domain/usecases/get_file_by_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_folder_test.mocks.dart';

void main() {
  late MockFileRepository repository;
  late GetFileByPath getFileByPath;

  setUp(() {
    repository = MockFileRepository();
    getFileByPath = GetFileByPath(repository);
  });

  test('should return a list of files when repository returns a list of files',
      () async {
    // arrange
    final files = RightApp([File('file1.txt'), File('file2.txt')]);
    when(repository.getFiles()).thenAnswer((_) async => files);

    // act
    final result = await getFileByPath(NoParams());

    // assert
    expect(result, files);
  });

  test('should throw an exception when repository throws an exception',
      () async {
    // arrange
    when(repository.getFiles()).thenThrow(Exception());

    // act and assert
    expect(() async => await getFileByPath(NoParams()), throwsException);
  });

  test('should return an empty list when repository returns an empty list',
      () async {
    final expectResult = RightApp<List<File>>([]);
    // arrange
    when(repository.getFiles()).thenAnswer((_) async => expectResult);

    // act
    final result = await getFileByPath(NoParams());

    // assert
    expect(result, expectResult);
  });
}
