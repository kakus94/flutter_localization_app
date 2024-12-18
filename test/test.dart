import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'utils/utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('File Reader Tests', () {
    test('Should read localization_pl.arb file correctly', () async {
      final file1 = await Utils.readAsset(Lang.pl);
      final file2 = await Utils.readAsset(Lang.en);
      final file3 = await Utils.readAsset(Lang.it);

      final file = File('test_resources/localization_pl.arb');
      file.writeAsString('{}');

      expect(file1, isNotNull);
      expect(file2, isNotNull);
      expect(file3, isNotNull);
    });
  });
}
