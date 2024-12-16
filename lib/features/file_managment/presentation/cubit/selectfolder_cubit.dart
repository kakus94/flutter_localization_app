import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart';

part 'selectfolder_state.dart';

class SelectFolderCubit extends Cubit<SelectFolderState> {
  SelectFolderCubit(this.fileRepository)
      : super(const SelectFolderState(
          selectedFolder: null,
          files: [],
          content: '',
        ));

  final FileRepository fileRepository;

  void selectFolder() async {
    final folder = await FilePicker.platform.getDirectoryPath();
    fileRepository.selectFolder(folder);
    if (folder != null) {
      emit(state.copyWith(selectedFolder: folder));
      getFiles();
    }
  }

  Future<void> getFiles() async {
    final files = await fileRepository.getFiles();

    if (files.isEmpty) {
      emit(state.copyWith(files: []));
    }
    emit(state.copyWith(files: files.toList()));
  }

  void reset() {}

  Future<void> getPage(int index) async {
    if (state.files.isNotEmpty) {
      final entity = state.files[index];
      final file = await entity.stat();
      if (file.type == FileSystemEntityType.file) {
        final contents = await (entity as File).readAsString();
        emit(state.copyWith(content: contents));
      } else {
        emit(state.copyWith(content: ''));
      }
    }
  }
}
