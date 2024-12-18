import 'package:flutter_localization_app/core/type/typedef.dart';

abstract class UseCase<Type, Params> {
  FutureApp<Type> call(Params params);
}
