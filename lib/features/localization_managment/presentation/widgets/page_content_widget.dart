import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_app/features/file_managment/data/models/localization_model.dart';
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
          Row(
            children: [
              Text(
                state.activeKey,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              TextButton(
                  onPressed: () {
                    cubit.save(models, state.activeKey);
                  },
                  child: Text('Save'))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: models.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [Text(cubit.state.langList[index])]),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PageEdit(
                          entity: models[index],
                          updateValue: () {},
                        ),
                        Builder(builder: (context) {
                          final entity = models[index];
                          LocalizationModel model = LocalizationModel(
                            keyValue: entity.keyValue,
                            value: entity.value,
                            description: entity.description,
                            placeholders: entity.placeholders,
                          );
                          return Text(
                              model.convertToString().replaceAll(',', ',\n'));
                        })
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    )
                  ],
                );
              },
            ),
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
        TextField(
          onChanged: (c) => cubit.updateValue(c, index),
          controller: TextEditingController(text: models[index].value),
        ),
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

  Row placeholderWidget(List<LocalizationEntity> models, int index) {
    return Row(
      children: [
        SizedBox(width: 25),
        Text("Placeholder: "),
        Text(
          models[index].placeholders.toString(),
          style: TextStyle(),
        ),
      ],
    );
  }
}

class PageEdit extends StatefulWidget {
  PageEdit({super.key, required this.entity, required this.updateValue});

  LocalizationEntity entity;
  final Function updateValue;

  @override
  State<PageEdit> createState() => __PageEditState();
}

class __PageEditState extends State<PageEdit> {
  @override
  Widget build(BuildContext context) {
    TextEditingController valueController =
        TextEditingController(text: widget.entity.value);
    TextEditingController descriptionController =
        TextEditingController(text: widget.entity.description);
    TextEditingController placeholdersController =
        TextEditingController(text: widget.entity.placeholders.toString());
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [Text('Value: ')]),
            SizedBox(
              width: 200,
              child: TextField(
                controller: valueController,
                onChanged: (c) => widget.entity.copyWith(value: c),
              ),
            ),
            Row(children: [Text('Description: ')]),
            SizedBox(
              width: 200,
              child: TextField(
                controller: descriptionController,
                onChanged: (c) => widget.entity.copyWith(description: c),
              ),
            ),
            Row(children: [Text('Placeholder: ')]),
            SizedBox(
              width: 200,
              child: TextField(
                controller: placeholdersController,
                onChanged: (c) =>
                    widget.entity.copyWith(placeholders: json.decode(c)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
