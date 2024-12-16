import 'package:dartz/dartz.dart';
import 'package:flutter_localization_app/core/error/failures.dart';

typedef FutureE<T> = Future<Either<Failure, T>>;
