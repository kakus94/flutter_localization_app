import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class File extends Equatable {
  const File({required this.data}) : super();

  final Uint8List data;

  @override
  List<Object> get props => [data];
}
