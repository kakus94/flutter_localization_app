import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/cubit/selectfolder_cubit.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key, required this.cubit});

  final SelectFolderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFolderCubit, SelectFolderState>(
      bloc: cubit,
      builder: (context, state) => Column(
        children: [
          Text(state.content ?? ''),
        ],
      ),
    );
  }
}
