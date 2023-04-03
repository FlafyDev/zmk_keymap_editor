import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zmk_keymap_editor/main.dart';
import 'package:zmk_keymap_editor/providers/keymap_provider.dart';
import 'package:zmk_keymap_editor/widgets/layer_editor.dart';

class LayerMenu extends HookConsumerWidget {
  const LayerMenu(
      {required this.selectedLayerId, required this.onLayerSelected, Key? key})
      : super(key: key);

  final String selectedLayerId;
  final void Function(String) onLayerSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keymap = ref.watch(keymapProvider);
    final layers = keymap.layers;

    return ReorderableListView.builder(
      itemCount: layers.length,
      // separatorBuilder: (context, index) {
      //   return SizedBox(height: 8);
      // },
      buildDefaultDragHandles: false,

      proxyDecorator: (child, index, animation) {
        // cool scale animation
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            color: Colors.grey[850],
            child: ScaleTransition(
              scale: animation.drive(
                Tween(begin: 1.0, end: 1.05).chain(
                  CurveTween(curve: Curves.easeOut),
                ),
              ),
              child: child,
            ),
          ),
        );

        // return AnimatedBuilder(
        //   animation: animation,
        //   builder: (context, child) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         // borderRadius: BorderRadius.all(Radius.circular(18)),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.3),
        //             spreadRadius: 3,
        //             blurRadius: 18,
        //           ),
        //         ],
        //       ),
        //       child: child,
        //     );
        //   },
        //   child: child,
        // );
      },
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ElevatedButton(
          onPressed: () {
            showPopupDialog(
              context: context,
              builder: (context) {
                return LayerEditor();
              },
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            maximumSize: Size(200, 36),
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              // side: BorderSide(color: Colors.g),
            ),
            alignment: Alignment.centerLeft,
          ),
          child: Center(child: Text("Add layer")),
        ),
      ),
      itemBuilder: (context, index) {
        final layer = layers[index];
        final selected = layer.id == selectedLayerId;
        return ReorderableDragStartListener(
          index: index,
          key: ValueKey(layer.id),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: _LayerItem(
              layerName: layer.name,
              index: index,
              selected: selected,
              onPressed: () {
                onLayerSelected(layer.id);
              },
              onLongPress: () {
                showPopupDialog(
                  context: context,
                  builder: (context) {
                    return LayerEditor(
                      layer: layer,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          // removing the item at oldIndex will shorten the list by 1.
          newIndex -= 1;
        }
        ref.read(keymapProvider.notifier).moveLayer(oldIndex, newIndex);
        // final selectedLayer = ref.read(selectedLayerProvider);
        // if (selectedLayer > oldIndex && selectedLayer < newIndex)
        //   ref.read(selectedLayerProvider.notifier).state += 1;
        // else if (selectedLayer == oldIndex)
        //   ref.read(selectedLayerProvider.notifier).state = newIndex;
      },
    );
  }
}

class _LayerItem extends HookConsumerWidget {
  _LayerItem({
    required this.layerName,
    required this.index,
    required this.selected,
    required this.onPressed,
    required this.onLongPress,
    Key? key,
  }) : super(key: key);

  final String layerName;
  final int index;
  final bool selected;
  final void Function() onPressed;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: Duration(milliseconds: 150),
    );

    useEffect(() {
      if (selected) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return;
    }, [selected]);

    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        maximumSize: Size(200, 36),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          // side: BorderSide(color: Colors.g),
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.1),
          //     shape: BoxShape.circle,
          //   ),
          //   width: 35,
          //   height: 35,
          //   child: Icon(
          //     Icons.abc_outlined,
          //     color: Colors.white,
          //     size: 24,
          //   ),
          // ),
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    layerName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, _child) {
                          return Container(
                            width: 50 *
                                Curves.easeOut
                                    .transform(animationController.value),
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
