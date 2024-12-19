import 'dart:convert';
import 'dart:io';

import 'package:flutter_localization_app/features/file_managment/data/models/localization_model.dart';
import 'package:flutter_localization_app/features/file_managment/data/repositories/app_file_repository.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/data/repositories/repository_imp.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';
import '../fixtures/localization_mock.dart';
import '../utils/utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  FileRepository fileRepository = FileRepositoryImp();
  LocalizationRepository localizationRepository =
      RepositoryImp(fileRepository: fileRepository);

  test('save entities to file', () async {
    fileRepository.selectFolder('test/resources/temp');

    final entities = localizationMock;

    final result =
        await localizationRepository.saveEntity(entities: entities, lang: 'pl');

    expect(result.isRight(), true);

    //odczytanie pliku
    final cc = (await fileRepository.getFiles()).getOrElse(() => []);

    final xx = (cc.first as File).readAsStringSync();

    final yy = LocalizationModel.parseLocalizationEntities(xx);

    expect(yy.first.value, entities.first.value);

    //usuniecie pliku
    await fileRepository.deleteFile('pl');
  });
}
