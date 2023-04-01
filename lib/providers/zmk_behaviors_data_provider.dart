import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';

final zmkBehaviorsDataProvider = FutureProvider((ref) async {
  final dataString = await rootBundle.loadString('assets/data/behaviors.yaml');
  final dataJson = (loadYaml(dataString) as YamlList)
      .map((e) => (e as YamlMap).toMap())
      .toList();

  return dataJson.map((e) => ZMKDataBehavior.fromJson(e)).toList();
});
