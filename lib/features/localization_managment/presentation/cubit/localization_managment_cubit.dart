import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localization_managment_state.dart';

class LocalizationManagmentCubit extends Cubit<LocalizationManagmentState> {
  LocalizationManagmentCubit() : super(LocalizationManagmentInitial());
}
