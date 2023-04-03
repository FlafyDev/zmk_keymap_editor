import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:zmk_keymap_editor/main.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/providers/keymap_provider.dart';

class LayerEditor extends HookConsumerWidget {
  const LayerEditor({
    this.layer,
    Key? key,
  }) : super(key: key);

  final KeymapLayer? layer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layerName = useState(layer?.name ?? "");
    final layerNameController = useTextEditingController(text: layerName.value);

    return Container(
      width: 300,
      padding: EdgeInsets.all(12),
      child: Wrap(
        runSpacing: 20,
        children: [
          Center(
            child: Text(
              layer != null ? "Editing \"${layer!.name}\"" : "Add new layer",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          TextField(
            controller: layerNameController,
            decoration: makeInputDecoration(context, hintText: "Layer name"),
            onChanged: (value) {
              layerName.value = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (layer != null) {
                ref.read(keymapProvider.notifier).updateLayer(
                      layer!.copyWith(name: layerName.value),
                    );
              } else {
                ref.read(keymapProvider.notifier).addLayer(
                      KeymapLayer(
                        name: layerName.value,
                        keys: [],
                        id: Uuid().v4(),
                      ),
                    );
              }
              Navigator.of(context).pop();
            },
            child: Text(layer != null ? "Save" : "Add"),
          ),
          if (layer != null)
            ElevatedButton(
              onPressed: () {
                ref.read(keymapProvider.notifier).removeLayer(layer!.id);
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
        ],
      ),
    );
  }
}
