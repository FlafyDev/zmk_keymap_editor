import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/providers/layout_provider.dart';
import 'package:yaml_writer/yaml_writer.dart';

class KeymapNotifier extends StateNotifier<Keymap> {
  KeymapNotifier(Keymap keymap, this.ref) : super(keymap);

  final StateNotifierProviderRef ref;

  void updateKeyInLayer(String layerId, int keyIndex, ZMKBehavior behavior) {
    final newLayers = [...state.layers];
    final layer = newLayers.firstWhere((layer) => layer.id == layerId);
    final newKeys = [...layer.keys];
    newKeys[keyIndex] = behavior;
    newLayers[newLayers.indexWhere((layer) => layer.id == layerId)] =
        layer.copyWith(keys: newKeys);
    state = state.copyWith(layers: newLayers);
  }

  void addLayer(KeymapLayer layer) {
    state = state.copyWith(
      layers: [...state.layers, layer],
    );
    padBlankKeys(ref.read(layoutProvider).keys.length);
  }

  void removeLayer(String layerId) {
    state = state.copyWith(
      layers: state.layers.where((layer) => layer.id != layerId).toList(),
    );
  }

  void updateLayer(KeymapLayer layer) {
    final newLayers = [...state.layers];
    newLayers[newLayers.indexWhere((l) => l.id == layer.id)] = layer;
    state = state.copyWith(
      layers: newLayers,
    );
  }

  void padBlankKeys(int amount) {
    state = state.copyWith(
      layers: state.layers
          .map((layer) => layer.copyWith(keys: _padKeys(layer.keys, amount)))
          .toList(),
    );
  }

  List<ZMKBehavior> _padKeys(List<ZMKBehavior> keys, int amount) {
    return [
      ...keys,
      ...List.generate(
        amount - keys.length,
        (index) => ZMKBehavior('trans', []),
      ),
    ];
  }

  void moveLayer(int oldIndex, int newIndex) {
    final newLayers = [...state.layers];
    final layer = newLayers.removeAt(oldIndex);
    newLayers.insert(newIndex, layer);
    state = state.copyWith(layers: newLayers);
  }
}

final selectedLayerIdProvider = StateProvider<String>((ref) {
  final keymap = ref.read(keymapProvider);
  return keymap.layers.first.id;
});

final keymapFileProvider = StateProvider<File>((ref) {
  return File('/home/flafydev/kyria-keymap.yaml');
});

final keymapProvider = StateNotifierProvider<KeymapNotifier, Keymap>(
  (ref) {
    final file = ref.watch(keymapFileProvider);
    final notifier = KeymapNotifier(
        Keymap.fromJson((loadYaml(
                    file.readAsStringSync())
                as YamlMap)
            .toMap()),
        ref);

    notifier.padBlankKeys(ref.read(layoutProvider).keys.length);
    ref.listen(layoutProvider, (_prev, layout) {
      notifier.padBlankKeys(layout.keys.length);
    });

    return notifier;
  },
);
