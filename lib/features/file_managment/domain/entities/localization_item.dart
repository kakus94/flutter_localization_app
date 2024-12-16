class LocalizationItem {
  final String key;
  final String value;
  final TypeItem type;

  LocalizationItem(this.key, this.value, this.type);
}

enum TypeItem {
  string,
  int,
  double,
  bool,
}
