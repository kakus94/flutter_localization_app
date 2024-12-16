import 'package:equatable/equatable.dart';

class Folder extends Equatable {
  final String path;

  const Folder({
    required this.path,
  });

  @override
  List<Object?> get props => [path];
}
