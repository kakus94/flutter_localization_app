import 'package:dartz/dartz.dart';
import 'package:flutter_localization_app/core/error/failures.dart';

typedef FutureApp<T> = Future<Either<Failure, T>>;
typedef RightApp<T> = Right<Failure, T>;
typedef LeftApp<T> = Left<Failure, T>;
