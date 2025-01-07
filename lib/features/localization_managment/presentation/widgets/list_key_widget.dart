import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/localization_managment/presentation/cubit/localization_managment_cubit.dart';

class ListKeyWidget extends StatelessWidget {
  const ListKeyWidget({super.key, required this.cubit});

  final LocalizationManagmentCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationManagmentCubit, LocalizationManagmentState>(
      bloc: cubit..getMapLocalization(),
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.keys.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await cubit.selectKey(index);
                },
                child: Text(
                  state.keys[index],
                  style: TextStyle(
                      backgroundColor:
                          state.selectIndex != index ? null : Colors.amber),
                ),
              );
            });
      },
    );
  }
}
