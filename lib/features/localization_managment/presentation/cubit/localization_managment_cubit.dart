import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart';

part 'localization_managment_state.dart';

class LocalizationManagmentCubit extends Cubit<LocalizationManagmentState> {
  //reference to repository
  FileRepository fileRepository;
  LocalizationRepository localizationRepository;

  LocalizationManagmentCubit({
    required this.fileRepository,
    required this.localizationRepository,
  }) : super(LocalizationManagmentState(
            content: {}, selectIndex: 0, langList: ['pl', 'en', 'it']));

  Future<void> getMapLocalization() async {
    getFiles();
    final result = await localizationRepository.getMapLocalization();
    result.fold(
        (failure) => emit(state),
        (map) => emit(
              state.copyWith(content: map),
            ));
  }

  Future<void> getFiles() async {
    (await fileRepository.getFiles()).fold(
      (left) => emit(state),
      (right) => emit(state.copyWith(langList: getFileName(right))),
    );
  }

  Future<void> selectKey(int index) async {
    emit(state.copyWith(selectIndex: index));
    print('select index $index');
  }

  List<String> getFileName(List<FileSystemEntity> right) {
    List<String> result = [];
    for (var i = 0; i < right.length; i++) {
      final file = right[i];
      final list = file.path.split('/');
      result.add(list.last);
    }
    return result;
  }

  updateValue(String c, int index) {
    final content = state.content;
    final model = content[state.activeKey]![index];
    LocalizationEntity localizationEntity = LocalizationEntity(
      keyValue: model.keyValue,
      value: c,
      description: model.description,
      placeholders: model.placeholders,
    );
    content[state.activeKey]![index] = localizationEntity;
    emit(state.copyWith(content: content));
  }

  void save(List<LocalizationEntity> models, String activeKey) {}
}
