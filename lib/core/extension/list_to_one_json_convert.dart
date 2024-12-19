extension ListToOneJsonConvert on List<String> {
  String toOneJsonString() => '{${join(',')}}';
}
