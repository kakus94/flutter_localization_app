import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/cubit/selectfolder_cubit.dart';

class ButtonSelectFolderWidget extends StatelessWidget {
  const ButtonSelectFolderWidget({super.key, required this.cubit});

  final SelectFolderCubit cubit;

  void _selectFolder() async {
    cubit.selectFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<SelectFolderCubit, SelectFolderState>(
        bloc: cubit,
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectFolder,
              child: Text(
                'Select Folder',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(state.getShortDictonary ?? ''),
            ),
          ],
        ),
        listener: listener,
      ),
    );
  }

  void listener(BuildContext context, Object? state) {}
}
