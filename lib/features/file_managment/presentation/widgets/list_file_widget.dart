import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/cubit/selectfolder_cubit.dart';

class ListFileWidget extends StatelessWidget {
  const ListFileWidget({Key? key, required this.cubit}) : super(key: key);

  final SelectFolderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: cubit,
      builder: builder,
      listener: listener,
    );
  }

  Widget builder(BuildContext context, state) {
    if (state.files.isEmpty) {
      return const Text('No files');
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.files.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        child: GestureDetector(
          onTap: () {
            cubit.getPage(index);
          },
          child: Text(state.nameFile[index]),
        ),
      ),
    );
  }

  void listener(BuildContext context, state) {}
}
