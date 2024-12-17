import 'package:flutter/material.dart';
import 'package:flutter_localization_app/features/file_managment/data/repositories/app_file_repository.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/cubit/selectfolder_cubit.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/widgets/button_select_folder_widget.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/widgets/content_widget.dart';
import 'package:flutter_localization_app/features/file_managment/presentation/widgets/list_file_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestView(),
    );
  }
}

final cubit = SelectFolderCubit(FileRepositoryImp());

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lokalizacja aplikacji '),
        ),
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  ButtonSelectFolderWidget(cubit: cubit),
                  ListFileWidget(cubit: cubit),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: ContentWidget(cubit: cubit),
            )
          ],
        ));
  }
}
