import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:zmk_keymap_editor/main.dart';
import 'package:zmk_keymap_editor/models/zmk.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';
import 'package:zmk_keymap_editor/providers/zmk_data_behaviors_provider.dart';

class KeyCodeEditor extends HookConsumerWidget {
  const KeyCodeEditor({
    this.code,
    required this.onCodeChanged,
    Key? key,
  }) : super(key: key);

  final String? code;
  final void Function(String?) onCodeChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newCode = useState(code);
    final data = ref.watch(zmkDataBehaviorsProvider);
    final textController = useTextEditingController();

    return Container(
      width: 300,
      height: 500,
      child: data.when(
        data: (data) {
          return SearchableList<ZMKDataBehavior>(
            initialList: data
                .where(
                  (element) =>
                      element.name.toLowerCase().contains(textController.value.text) ||
                      element.code.toLowerCase().contains(textController.value.text),
                )
                .toList(),
            builder: (ZMKDataBehavior behavior) => Material(
              child: ListTile(
                title: Text(behavior.name),
                selected: newCode.value == behavior.code,
                subtitle: Text("${behavior.code} " +
                    behavior.params
                        .map((param) => "<${param.name}>")
                        .join(", ")),
                onTap: () {
                  newCode.value = behavior.code;
                  onCodeChanged(newCode.value);
                },
              ),
            ),
            displayClearIcon: false,
            filter: (value) => data
                .where(
                  (element) =>
                      element.name.toLowerCase().contains(value.toLowerCase()) ||
                      element.code.toLowerCase().contains(value.toLowerCase()),
                )
                .toList(),
            searchTextController: textController,
            inputDecoration: makeInputDecoration(context, hintText: "Code"),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text(error.toString())),
      ),
    );
  }
}
