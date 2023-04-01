import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/models/layout.dart';

class LayoutNotifier extends StateNotifier<Layout> {
  LayoutNotifier()
      : super(Layout.fromJson(
            (loadYaml(File('assets/layouts/kyria.yaml').readAsStringSync())
                as YamlMap).toMap()));

  addLayoutKey(LayoutKey key) {
    state = state.copyWith(keys: [...state.keys, key]);
  }

  updateLayoutKey(int index, LayoutKey newKey) {
    state = state.copyWith(keys: [
      ...state.keys.sublist(0, index),
      newKey,
      ...state.keys.sublist(index + 1),
    ]);
  }
}

final layoutProvider = StateNotifierProvider<LayoutNotifier, Layout>(
  (ref) => LayoutNotifier(),
);
