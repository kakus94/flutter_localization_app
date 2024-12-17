import 'dart:convert';

import 'package:flutter_localization_app/core/type/typedef.dart';
import 'package:flutter_localization_app/core/utils/utils.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';
import 'dart:io';

class RepositoryImp implements LocalizationRepository {
  final FileRepository fileRepository;

  RepositoryImp({required this.fileRepository});

  @override
  FutureApp<Map<String, Map<String, dynamic>>> getMapLocalization() {
    throw UnimplementedError();
  }

  @override
  FutureApp<Map<String, dynamic>> getMapLocalizationByLang(String lang) async {
    final fileName = Utils.fileName(lang: lang);
    final files = await fileRepository.getFiles();

    final file = files.firstWhere((element) => element.path.contains(fileName));

    final contents = await (file as File).readAsString();
    final jsonDecode = Map<String, dynamic>.from(json.decode(contents));
    return RightApp(jsonDecode);
  }
}
