import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Column(
          children: [
            FilledButton(onPressed: () {}, child: Text('DONE')),
            ContentView(state: state, cubit: cubit),
          ],
        );
      },
    );
  }
}

class ContentView extends StatefulWidget {
  ContentView({required this.state, required this.cubit});

  LocalizationManagmentState state;
  final LocalizationManagmentCubit cubit;

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    final x = widget.state;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: x.content[x.activeKey]!.length,
        itemBuilder: (context, index) {
          final entity = x.content[x.activeKey]![index];
          return Column(
            children: [
              EditText(
                  textField: true,
                  text: x.content[x.activeKey]?[index].value ?? '',
                  desc: 'Value',
                  onChange: (value) => setState(() {
                        x.content[x.activeKey]![index] =
                            entity.copyWith(value: value);
                      })),
              SizedBox(height: 10),
              EditText(
                textField: true,
                text: x.content[x.activeKey]?[index].description ?? '',
                desc: 'Description',
                onChange: (value) => setState(
                  () {
                    x.content[x.activeKey]![index] =
                        entity.copyWith(description: value);
                  },
                ),
              ),
              SizedBox(height: 10),
              EditText(
                textField: false,
                text: jsonEncode(x.content[x.activeKey]?[index].placeholders),
                desc: 'Placeholders',
                onChange: (value) {
                  x.content[x.activeKey]![index] =
                      entity.copyWith(placeholders: jsonDecode(value));
                },
              ),
              SizedBox(height: 10),
            ],
          );
        });
  }
}

String jsonEncode(Map<String, dynamic>? map) {
  if (map == null) {
    return '{}';
  }
  return json.encode(map);
}

class EditText extends StatefulWidget {
  const EditText(
      {super.key,
      required this.text,
      required this.desc,
      required this.textField,
      required this.onChange});

  final String text;
  final String desc;
  final bool textField;
  final Function(String) onChange;

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  late FocusNode _focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    print('initState');
    _focusNode = FocusNode();
    controller = TextEditingController(text: widget.text);

    // Dodaj listener do focusNode
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('Pole ${widget.desc} uzyskało fokus');
      } else {
        print('Pole ${widget.desc} straciło fokus');
        // Wywołanie onChange przy utracie fokusu
        widget.onChange(controller.text);
      }
    });
  }

  @override
  void didUpdateWidget(EditText oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Aktualizuj kontroler, jeśli zmienił się tekst
    if (oldWidget.text != widget.text) {
      print('Aktualizacja kontrolera: ${widget.text}');
      controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    print('dispose');
    _focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.textField)
          TextField(
            controller: controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.desc,
            ),
            onTapOutside: (_) => widget.onChange(controller.text),
            onEditingComplete: () => widget.onChange(controller.text),
          ),
        if (!widget.textField)
          TextFormField(
            controller: controller,
            focusNode: _focusNode,
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.desc,
            ),
            onTapOutside: (_) => widget.onChange(controller.text),
            onEditingComplete: () => widget.onChange(controller.text),
          ),
      ],
    );
  }
}
