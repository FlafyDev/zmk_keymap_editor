import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/extensions/zmk_keymap_converter.dart';
import 'package:zmk_keymap_editor/providers/zmk_data_behaviors_provider.dart';
import 'package:zmk_keymap_editor/save_keymap_as_yaml.dart';
import 'package:zmk_keymap_editor/widgets/layout.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'models/keymap.dart';
import 'providers/keymap_provider.dart';
import 'widgets/layer_menu.dart';

void main() {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  print(Keymap.fromJson(
      (loadYaml(File('/home/flafydev/kyria-keymap.yaml').readAsStringSync())
              as YamlMap)
          .toMap()));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLayerId = ref.watch(selectedLayerIdProvider);

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Row(
          children: [
            Container(
              width: 200,
              color: Colors.grey[900],
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 300,
                      child: LayerMenu(
                        selectedLayerId: selectedLayerId,
                        onLayerSelected: (newLayerId) {
                          ref.read(selectedLayerIdProvider.notifier).state =
                              newLayerId;
                        },
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        final keymap = ref.read(keymapProvider);
                        final keymapFile = ref.read(keymapFileProvider);

                        await saveKeymap(keymap, keymapFile);
                        final zmkDataBehaviors =
                            await ref.read(zmkDataBehaviorsProvider.future);
                        final zmkKeymap = keymap.toZmkKeymap(zmkDataBehaviors);
                        await File(
                                "/mnt/general/repos/flafydev/zmk-config/config/kyria_rev3.keymap")
                            .writeAsString(zmkKeymap);
                      },
                      child: Text("Compile"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: LayoutWidget(
                layerId: selectedLayerId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration makeInputDecoration(
  BuildContext context, {
  String? hintText,
}) {
  final theme = Theme.of(context);

  return InputDecoration(
    filled: true,
    fillColor: theme.buttonTheme.colorScheme?.background.withOpacity(0.5),
    labelText: hintText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: theme.buttonTheme.colorScheme?.outline ?? Colors.black),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
          color: theme.buttonTheme.colorScheme?.outline ?? Colors.black),
    ),
  );
}

void showPopupDialog({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  showDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Material(
          child: builder(context),
        ),
      );
    },
  );
}
