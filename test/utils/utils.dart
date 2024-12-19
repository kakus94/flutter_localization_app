import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_localization_app/core/type/typedef.dart';

class Utils {
  static const _pl = 'test/resources/localization/localization_pl.arb';
  static const _en = 'test/resources/localization/localization_en.arb';
  static const _it = 'test/resources/localization/localization_it.arb';

  static Future<Map<String, dynamic>> readAsset(Lang lang) async {
    // Wczytaj plik jako String
    final jsonString = await rootBundle.loadString(lang.fileName());
    // Zdekoduj zawartość na Mapę
    final result = json.decode(jsonString);
    return result as Map<String, dynamic>;
  }

  static FutureApp<File> getFile(Lang lang) async {
    final file = File(lang.fileName());
    file.writeAsStringSync(lang.content());
    return RightApp(file);
  }

  static FutureApp<List<File>> getFiles() async {
    final files = <File>[];

    for (var e in Lang.values) {
      final file = File(e.fileName());
      file.writeAsString(e.content());
      files.add(file);
    }

    return RightApp(files);
  }

//MARK: Content
  static final fileContenPL = '''
{
    "@@locale": "pl",
    "home": "Strona główna",
    "@home": {},
    "profile": "Profil",
    "@profile": {},
    "settings": "Ustawienia",
    "@settings": {},
    "language": "Język",
    "@language": {},
    "english": "Angielski",
    "@english": {}
}
''';
  static final fileContenEN = '''
{
    "@@locale": "en",
    "home": "Home",
    "@home": {},
    "profile": "Profile",
    "@profile": {},
    "settings": "Settings",
    "@settings": {},
    "language": "Language",
    "@language": {},
    "english": "English",
    "@english": {}
}
''';
  static final fileContenIT = '''
{
    "@@locale": "it",
    "home": "Casa",
    "@home": {},
    "profile": "Profilo",
    "@profile": {},
    "settings": "Impostazioni",
    "@settings": {},
    "language": "Lingua",
    "@language": {},
    "english": "Inglese",
    "@english": {}
}
''';
}

enum Lang { en, pl, it }

extension LangExtension on Lang {
  String fileName() {
    switch (this) {
      case Lang.en:
        return Utils._en;
      case Lang.pl:
        return Utils._pl;
      case Lang.it:
        return Utils._it;
    }
  }

  String content() {
    switch (this) {
      case Lang.en:
        return Utils.fileContenEN;
      case Lang.pl:
        return Utils.fileContenPL;
      case Lang.it:
        return Utils.fileContenIT;
    }
  }
}
