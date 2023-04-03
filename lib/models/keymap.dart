import 'package:freezed_annotation/freezed_annotation.dart';

part 'keymap.freezed.dart';
part 'keymap.g.dart';

// code without the '&' prefix
class ZMKBehavior {
  const ZMKBehavior(this.code, this.params);

  final String code;
  final List<String> params;

  String? param(int index) => params.length > index ? params[index] : null;

  factory ZMKBehavior.fromJson(List<String> json) {
    return ZMKBehavior(
      json[0],
      json.skip(1).map((e) => e).toList(),
    );
  }

  ZMKBehavior copyWith({
    String? code,
    List<String>? params,
  }) {
    return ZMKBehavior(
      code ?? this.code,
      params ?? this.params,
    );
  }


  List<String> toJson() => [
        code,
        ...params,
      ];
}

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
