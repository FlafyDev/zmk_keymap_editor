import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/providers/layout_provider.dart';

class KeymapNotifier extends StateNotifier<Keymap> {
  KeymapNotifier(Keymap keymap) : super(keymap);

  void updateKeyInLayer(String layer, int keyIndex, ZMKBehavior behavior) {
    state = state.copyWith(layers: {
      ...state.layers,
      layer: [
        ...state.layers[layer]!.sublist(0, keyIndex),
        behavior,
        ...state.layers[layer]!.sublist(keyIndex + 1),
      ],
    });
  }

  void padBlankKeys(int amount) {
    state = state.copyWith(
        layers: state.layers.map((layerName, keys) => MapEntry(layerName, [
              ...keys,
              ...List.generate(
                amount - keys.length,
                (index) => ZMKBehavior('trans', []),
              ),
            ])));
  }
}

final keymapProvider = StateNotifierProvider<KeymapNotifier, Keymap>(
  (ref) {
    final notifier = KeymapNotifier(Keymap.fromJson(
        (loadYaml(File('/home/flafydev/kyria-keymap.yaml').readAsStringSync())
                as YamlMap)
            .toMap()));


    notifier.padBlankKeys(ref.read(layoutProvider).keys.length);
    ref.listen(layoutProvider, (_prev, layout) {
      notifier.padBlankKeys(layout.keys.length);
    });

    return notifier;
  },
);
