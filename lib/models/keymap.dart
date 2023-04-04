import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmk_keymap_editor/models/zmk.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';

part 'keymap.freezed.dart';
part 'keymap.g.dart';


@freezed
class KeymapLayer with _$KeymapLayer {
  const factory KeymapLayer({
    required String name,
    required String id,
    required List<ZMKBehavior> keys,
  }) = _KeymapLayer;

  factory KeymapLayer.fromJson(Map<String, Object?> json) =>
      _$KeymapLayerFromJson(json);
}

@freezed
class Keymap with _$Keymap {
  const Keymap._();
  const factory Keymap({
    required String name,
    required List<KeymapLayer> layers,
  }) = _Keymap;

  factory Keymap.fromJson(Map<String, Object?> json) => _$KeymapFromJson(json);

  List<String> get layerNames => layers.map((e) => e.name).toList();

  KeymapLayer layerFromId(String id) {
    return layers.firstWhere((element) => element.id == id);
  }
}
