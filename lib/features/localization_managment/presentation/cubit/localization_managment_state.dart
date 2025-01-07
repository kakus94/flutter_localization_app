part of 'localization_managment_cubit.dart';

class LocalizationManagmentState extends Equatable {
  const LocalizationManagmentState(
      {required this.content,
      required this.selectIndex,
      required this.langList})
      : super();

  final Map<String, List<LocalizationEntity>> content;
  final List<String> langList;
  final int selectIndex;

  List<String> get keys => content.keys.toList();
  String get activeKey => keys.isEmpty ? '' : keys[selectIndex];

  List<LocalizationEntity> get activeLocalization => content[activeKey] ?? [];

  @override
  List<Object> get props => [content, selectIndex, langList];

  LocalizationManagmentState copyWith(
      {Map<String, List<LocalizationEntity>>? content,
      int? selectIndex,
      List<String>? langList}) {
    return LocalizationManagmentState(
        content: content ?? this.content,
        selectIndex: selectIndex ?? this.selectIndex,
        langList: langList ?? this.langList);
  }
}
