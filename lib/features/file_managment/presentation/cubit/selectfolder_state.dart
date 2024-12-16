part of 'selectfolder_cubit.dart';

class SelectFolderState {
  const SelectFolderState(
      {required this.selectedFolder,
      required this.files,
      required this.content});

  final String? selectedFolder;
  final List<FileSystemEntity> files;
  final String? content;

  List<String> get nameFile =>
      files.map((e) => e.path.split('/').last).toList();

  String? get getShortDictonary => selectedFolder == null
      ? "Brak"
      : selectedFolder!
          .split('/')
          .skip(selectedFolder!.split('/').length - 2)
          .join('/');

  copyWith({
    String? selectedFolder,
    List<FileSystemEntity>? files,
    String? content,
  }) {
    return SelectFolderState(
      selectedFolder: selectedFolder ?? this.selectedFolder,
      files: files ?? this.files,
      content: content ?? this.content,
    );
  }
}
