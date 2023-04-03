import 'dart:io';

import 'package:yaml_writer/yaml_writer.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';

Future<void> saveKeymap(Keymap keymap, File file) async {
  await file.writeAsString(YAMLWriter().write(keymap.toJson()));
}
