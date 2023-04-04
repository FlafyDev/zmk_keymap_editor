import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zmk_keymap_editor/main.dart';
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/providers/keymap_provider.dart';
import 'package:zmk_keymap_editor/providers/layout_provider.dart';
import 'package:zmk_keymap_editor/widgets/key.dart';
import 'package:zmk_keymap_editor/widgets/keyEditor.dart';
import 'package:zmk_keymap_editor/widgets/key_code_editor.dart';

class LayoutWidget extends HookConsumerWidget {
  LayoutWidget({required this.layerId, Key? key}) : super(key: key);

  final String layerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = ref.watch(layoutProvider);
    final keymap = ref.watch(keymapProvider);
    final pointerMoved = useRef(Offset.zero);
    final keys = keymap.layerFromId(layerId).keys;

    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Stack(
        children: [
          // Positioned.fill(child: Container(color: Colors.grey)),
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.2,
          //     child: Image(
          //       image: AssetImage("assets/kyria_left.png"),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          LayoutBuilder(builder: (context, contraints) {
            final keySize = Size(
              42 * contraints.maxWidth / 900,
              42 * contraints.maxWidth / 900,
            );
            return Center(
              child: Stack(
                children: layout.keys.asMap().entries.map(
                  (e) {
                    final index = e.key;
                    final key = e.value;
                    final behavior =
                        index >= keys.length ? keys[0] : keys[index];

                    final child = Transform.rotate(
                      angle: key.rotation,
                      child: KeyWidget(
                        behavior,
                        size: keySize,
                        onPressed: (partPressed) {
                          showPopupDialog(
                            context: context,
                            builder: (context) {
                              return KeyCodeEditor(
                                code: behavior.code,
                                onCodeChanged: (code) {
                                  // ref
                                  //     .read(keymapProvider.notifier)
                                  //     .updateKeyInLayer(layerId, index, code);
                                  // Navigator.of(context).pop();
                                },
                              );
                              // return KeyEditor(
                              //   behavior,
                              //   initialFocus: partPressed,
                              //   onKeyModify: (key) {
                              //     if (key != null) {
                              //       ref
                              //           .read(keymapProvider.notifier)
                              //           .updateKeyInLayer(
                              //               layerId, index, key);
                              //     }
                              //     Navigator.of(context).pop();
                              //   },
                              // );
                            },
                          );
                        },
                      ),
                    );

                    return Positioned(
                      left: ((key.x / 2 + 0.5) * contraints.maxWidth -
                              keySize.width / 2)
                          .roundToDouble(),
                      top: ((key.y / 2 + 0.5) * contraints.maxHeight -
                              keySize.height / 2)
                          .roundToDouble(),
                      child: Draggable(
                        childWhenDragging: Opacity(
                          opacity: .3,
                          child: child,
                        ),
                        maxSimultaneousDrags: 0,
                        onDragStarted: () {
                          pointerMoved.value = Offset.zero;
                        },
                        onDragUpdate: (details) {
                          pointerMoved.value = Offset(
                            pointerMoved.value.dx + details.delta.dx,
                            pointerMoved.value.dy + details.delta.dy,
                          );
                        },
                        onDragEnd: (details) {
                          ref.read(layoutProvider.notifier).updateLayoutKey(
                              index,
                              key.copyWith(
                                x: double.parse((key.x +
                                        pointerMoved.value.dx /
                                            contraints.maxWidth *
                                            2)
                                    .toStringAsFixed(3)),
                                y: double.parse((key.y +
                                        pointerMoved.value.dy /
                                            contraints.maxHeight *
                                            2)
                                    .toStringAsFixed(3)),
                              ));
                        },
                        feedback: child,
                        child: child,
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
