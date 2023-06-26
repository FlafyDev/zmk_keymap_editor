import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:zmk_keymap_editor/main.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/models/zmk.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';
import 'package:zmk_keymap_editor/providers/keymap_provider.dart';
import 'package:zmk_keymap_editor/providers/zmk_data_behaviors_provider.dart';
import 'package:zmk_keymap_editor/providers/zmk_keycodes_provider.dart';

class KeyParamEditor extends HookConsumerWidget {
  const KeyParamEditor({
    required this.param,
    required this.onParamChanged,
    required this.dataBehavior,
    Key? key,
  }) : super(key: key);

  final ZMKDataBehavior dataBehavior;
  final ZMKBehaviorParam param;
  final void Function(ZMKBehaviorParam) onParamChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget paramWidget;
    switch (param.type) {
      case ZMKBehaviorParamType.keycode:
        paramWidget = _ParamKeycode(
          param: param as ZMKBehaviorParamKeycode,
          onParamChanged: onParamChanged,
        );
        break;
      case ZMKBehaviorParamType.layer:
        paramWidget = _ParamLayer(
          param: param as ZMKBehaviorParamLayer,
          onParamChanged: onParamChanged,
        );
        break;
      case ZMKBehaviorParamType.options:
        paramWidget = _ParamOptions(
          param: param as ZMKBehaviorParamOptions,
          onParamChanged: onParamChanged,
          options: dataBehavior.options!,
        );
        break;
      case ZMKBehaviorParamType.int:
        paramWidget = _ParamInt(
          param: param as ZMKBehaviorParamInt,
          onParamChanged: onParamChanged,
        );
        break;
      case ZMKBehaviorParamType.string:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ZMKBehaviorParamType.color:
        // TODO: Handle this case.
        throw UnimplementedError();
    }

    return Container(
      width: 300,
      height: 500,
      child: paramWidget,
    );
  }
}

class _ParamKeycode extends HookConsumerWidget {
  const _ParamKeycode({
    required this.param,
    required this.onParamChanged,
    Key? key,
  }) : super(key: key);

  final ZMKBehaviorParamKeycode param;
  final void Function(ZMKBehaviorParamKeycode) onParamChanged;

  static final Map<String, String> dataModifiers = {
    "LC": "Left Ctrl",
    "LS": "Left Shift",
    "LA": "Left Alt",
    "LG": "Left Gui",
    "RC": "Right Ctrl",
    "RS": "Right Shift",
    "RA": "Right Alt",
    "RG": "Right Gui",
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keycodes = ref.watch(zmkKeycodesProvider);
    final newKeycode = useState(param.keycode);
    final newModifiers = useState(param.modifiers);
    final textController = useTextEditingController();

    void changed() {
      onParamChanged(ZMKBehaviorParamKeycode(
        keycode: newKeycode.value,
        modifiers: newModifiers.value,
      ));
    }

    return keycodes.whenOrNull(
          data: (keycodes) {
            return Column(
              children: [
                Expanded(
                  child: SearchableList<String>(
                    initialList: keycodes
                        .where((element) => element
                            .toLowerCase()
                            .contains(textController.value.text))
                        .toList(),
                    builder: (String keycode) => Material(
                      child: ListTile(
                        title: Text(keycode),
                        selected: newKeycode.value == keycode,
                        onTap: () {
                          newKeycode.value = keycode;

                          changed();
                        },
                      ),
                    ),
                    displayClearIcon: false,
                    filter: (value) => keycodes
                        .where((element) => element
                            .toLowerCase()
                            .contains(textController.value.text))
                        .toList(),
                    searchTextController: textController,
                    inputDecoration:
                        makeInputDecoration(context, hintText: "Keycode"),
                  ),
                ),
                Container(
                  height: 100,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                    children: dataModifiers.entries
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    newModifiers.value.contains(e.key)
                                        ? Colors.blue
                                        : Colors.grey,
                              ),
                              onPressed: () {
                                if (newModifiers.value.contains(e.key)) {
                                  newModifiers.value = newModifiers.value
                                      .where((element) => element != e.key)
                                      .toList();
                                } else {
                                  newModifiers.value = [
                                    ...newModifiers.value,
                                    e.key
                                  ];
                                }
                                changed();
                              },
                              child: Center(child: Text(e.value)),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            );
          },
        ) ??
        Container();
  }
}

class _ParamLayer extends HookConsumerWidget {
  const _ParamLayer({
    required this.param,
    required this.onParamChanged,
    Key? key,
  }) : super(key: key);

  final ZMKBehaviorParamLayer param;
  final void Function(ZMKBehaviorParamLayer) onParamChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layers = ref.watch(keymapProvider).layers;
    final newLayerId = useState(param.layerId);
    final textController = useTextEditingController();

    void changed() {
      onParamChanged(ZMKBehaviorParamLayer(
        layerId: newLayerId.value,
      ));
    }

    return SearchableList<KeymapLayer>(
      initialList: layers
          .where((element) =>
              element.name.toLowerCase().contains(textController.value.text))
          .toList(),
      builder: (layer) => Material(
        child: ListTile(
          title: Text(layer.name),
          selected: newLayerId.value == layer.id,
          onTap: () {
            newLayerId.value = layer.id;
            changed();
          },
        ),
      ),
      displayClearIcon: false,
      filter: (value) => layers
          .where((element) =>
              element.name.toLowerCase().contains(textController.value.text))
          .toList(),
      searchTextController: textController,
      inputDecoration: makeInputDecoration(context, hintText: "Layer"),
    );
  }
}

class _ParamOptions extends HookConsumerWidget {
  const _ParamOptions({
    required this.param,
    required this.onParamChanged,
    required this.options,
    Key? key,
  }) : super(key: key);

  final ZMKBehaviorParamOptions param;
  final void Function(ZMKBehaviorParamOptions) onParamChanged;
  final Map<String, ZMKDataBehaviorExternalParam?> options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newSelected = useState(param.selected);
    final newExternalParam = useState<ZMKDataBehaviorExternalParam?>(null);
    final textController = useTextEditingController();

    useEffect(() {
      newExternalParam.value = options[newSelected.value];
      return;
    }, [newSelected]);

    void changed() {
      onParamChanged(ZMKBehaviorParamOptions(
        selected: newSelected.value,
      ));
    }

    return SearchableList<String>(
      initialList: options.keys
          .where((e) => e.toLowerCase().contains(textController.value.text))
          .toList(),
      builder: (option) => Material(
        child: ListTile(
          title: Text(option),
          selected: newSelected.value == option,
          onTap: () {
            newSelected.value = option;
            changed();
          },
        ),
      ),
      displayClearIcon: false,
      filter: (value) => options.keys
          .where((e) => e.toLowerCase().contains(textController.value.text))
          .toList(),
      searchTextController: textController,
      inputDecoration: makeInputDecoration(context, hintText: "Option"),
    );
  }
}

class _ParamInt extends HookConsumerWidget {
  const _ParamInt({
    required this.param,
    required this.onParamChanged,
    Key? key,
  }) : super(key: key);

  final ZMKBehaviorParamInt param;
  final void Function(ZMKBehaviorParamInt) onParamChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newVal = useState(param.val);
    final textController = useTextEditingController(text: param.val.toString());

    void changed() {
      onParamChanged(ZMKBehaviorParamInt(
        val: newVal.value,
      ));
    }

    return TextField(
      controller: textController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        newVal.value = int.tryParse(value) ?? 0;
        changed();
      },
      decoration: makeInputDecoration(context, hintText: "Integer"),
    );
    // return SearchableList<KeymapLayer>( initialList:
    //       .where((element) =>
    //           element.name.toLowerCase().contains(textController.value.text))
    //       .toList(),
    //   builder: (layer) => Material(
    //     child: ListTile(
    //       title: Text(layer.name),
    //       selected: newLayerId.value == layer.id,
    //       onTap: () {
    //         newLayerId.value = layer.id;
    //         changed();
    //       },
    //     ),
    //   ),
    //   displayClearIcon: false,
    //   filter: (value) => layers
    //       .where((element) =>
    //           element.name.toLowerCase().contains(textController.value.text))
    //       .toList(),
    //   searchTextController: textController,
    //   inputDecoration: makeInputDecoration(context, hintText: "Layer"),
    // );
  }
}
