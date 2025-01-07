import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart';
import 'package:flutter_localization_app/features/localization_managment/presentation/cubit/localization_managment_cubit.dart';

class PageContentWidget extends StatelessWidget {
  const PageContentWidget({super.key, required this.cubit});

  final LocalizationManagmentCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationManagmentCubit, LocalizationManagmentState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        List<LocalizationEntity> models = state.content[state.activeKey] ?? [];
        return Column(children: [
          Text(
            state.activeKey,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: models.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [Text(cubit.state.langList[index])]),
                  SizedBox(width: 10),
                  rowValue(models, index),
                  SizedBox(width: 10),
                  rowDescription(models, index),
                  SizedBox(width: 10),
                  rowType(models, index),
                  SizedBox(height: 30),
                ],
              );
            },
          ),
        ]);
      },
    );
  }

  Row rowValue(List<LocalizationEntity> models, int index) {
    return Row(
      children: [
        SizedBox(width: 25),
        Text("Value: "),
        Text(
          models[index].value,
          style: TextStyle(),
        ),
      ],
    );
  }

  Row rowDescription(List<LocalizationEntity> models, int index) {
    return Row(
      children: [
        SizedBox(width: 25),
        Text("Desc: "),
        Text(
          models[index].description,
          style: TextStyle(),
        ),
      ],
    );
  }

  Row rowType(List<LocalizationEntity> models, int index) {
    return Row(
      children: [
        SizedBox(width: 25),
        Text("Type: "),
        Text(
          models[index].type,
          style: TextStyle(),
        ),
      ],
    );
  }
}
