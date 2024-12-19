import 'dart:convert';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_imp.dart';
import '../../../../core/extension/list_to_one_json_convert.dart';
import '../../../../core/type/typedef.dart';
import '../../../../core/utils/utils.dart';
import '../../../file_managment/data/models/localization_model.dart';
import '../../../file_managment/domain/entities/localization.dart';
import '../../../file_managment/domain/repositories/file_repository.dart';
import '../../domain/repositories/localization_repository.dart';
import 'dart:io';

class RepositoryImp implements LocalizationRepository {
  final FileRepository fileRepository;

  RepositoryImp({required this.fileRepository});

  @override
  FutureApp<Map<String, Map<String, dynamic>>> getMapLocalization() {
    throw UnimplementedError();
  }

  @override

  /// This method takes a language code and returns a map of localization data
  /// for the given language. It uses the [fileRepository] to get a list of
  /// files in the selected directory, and then finds the file that matches
  /// the given language code. It then reads the contents of the file and
  /// decodes it into a map of localization data.
  ///
  /// The method returns a [FutureApp] which is a utility class that wraps a
  /// [Future] and provides a way to handle both the successful and failed
  /// states of the [Future].
  ///
  /// The [FutureApp] returned by this method can be either a [RightApp] or a
  /// [LeftApp]. If the method is successful, it will return a [RightApp] with
  /// the map of localization data. If the method fails, it will return a
  /// [LeftApp] with a [Failure].
  ///
  /// The [Failure] can be one of two types: [FileNotFoundFailure] or
  /// [FileReadFailure].
  ///
  /// The [FileNotFoundFailure] is returned when the method is unable to find
  /// a file that matches the given language code.
  ///
  /// The [FileReadFailure] is returned when the method is unable to read the
  /// contents of the file.
  @override
  FutureApp<Map<String, dynamic>> getMapLocalizationByLang(String lang) async {
    final fileName = Utils.fileName(lang: lang);
    final files = await fileRepository.getFiles();

    return (await files.fold(
      (failure) async {
        return LeftApp(failure);
      },
      (files) async {
        try {
          final file =
              files.firstWhere((element) => element.path.contains(fileName));
          final contents = await (file as File).readAsString();
          final jsonDecode = Map<String, dynamic>.from(json.decode(contents));
          return RightApp(jsonDecode);
        } on FileSystemException {
          return LeftApp(FileNotFoundFailure());
        } on Exception {
          return LeftApp(FileReadFailure());
        }
      },
    ));
  }

  @override
  FutureApp<void> saveEntity(
      {required List<LocalizationEntity> entities, required String lang}) {
    final models = entities as List<LocalizationModel>;

    final jsonString =
        models.map((e) => e.convertToString()).toList().toOneJsonString();

    return fileRepository.createUpdateFile(lang, jsonString);
  }
}
