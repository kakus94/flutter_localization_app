import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code;
  final String desc;

  const Failure({required this.code, required this.desc}) : super();

  @override
  List<Object> get props => [code, desc];
}
