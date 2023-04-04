import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/models/zmk.dart';
import 'package:zmk_keymap_editor/providers/keymap_provider.dart';

class KeyWidget extends HookConsumerWidget {
  KeyWidget(
    this.behavior, {
    required this.size,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final ZMKBehavior behavior;
  final Size size;
  final void Function(int partPressed)? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final multipleParams = behavior.params.length >= 2;
    final keymap = ref.watch(keymapProvider);

    return Container(
      width: size.width,
      height: size.height,
      // decoration: BoxDecoration(
      //   // border radius
      //   borderRadius: BorderRadius.circular(8),
      //   border: Border.all(color: theme.primaryColor, width: 2),
      // ),
      child: ElevatedButton(
        onPressed: onPressed != null ? () => onPressed?.call(0) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.buttonTheme.colorScheme?.background,
          disabledBackgroundColor: theme.buttonTheme.colorScheme?.background,
          padding: EdgeInsets.all(0),
          disabledForegroundColor: theme.buttonTheme.colorScheme?.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 8.0 * (multipleParams ? 1 : 0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: behavior.params
                        .asMap()
                        .entries
                        .map(
                          (e) => FittedBox(
                            fit: BoxFit.fitWidth,
                            child: ElevatedButton(
                              onPressed: onPressed != null
                                  ? () => onPressed?.call(e.key + 1)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                disabledForegroundColor:
                                    theme.buttonTheme.colorScheme?.onBackground,
                                disabledBackgroundColor: Colors.transparent,
                                minimumSize: Size(0, 0),
                                padding: EdgeInsets.all(0),
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  e.value.getSaved(keymap.layers),
                                  style: TextStyle(
                                    fontSize: size.width /
                                        (4 + (multipleParams ? 1 : 0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "&${behavior.code}",
                  style: TextStyle(
                    fontSize: size.width / 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
