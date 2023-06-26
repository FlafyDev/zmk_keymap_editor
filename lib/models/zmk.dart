// code without the '&' prefix
import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';
import 'package:collection/collection.dart';

class ZMKBehavior {
  const ZMKBehavior(this.code, this.params);

  final String code;
  final List<ZMKBehaviorParam> params;

  ZMKBehaviorParam? param(int index) =>
      params.length > index ? params[index] : null;

  factory ZMKBehavior.fromJson(Map<String, Object?> json) {
    return ZMKBehavior(
      json["code"] as String,
      (json["params"] as List<dynamic>)
          .map<ZMKBehaviorParam>((param) => ZMKBehaviorParam.fromJson(param))
          .toList(),
    );
  }

  ZMKBehavior copyWith({
    String? code,
    List<ZMKBehaviorParam>? params,
  }) {
    return ZMKBehavior(
      code ?? this.code,
      params ?? this.params,
    );
  }

  Map<String, Object?> toJson() => {
        "code": code,
        "params": params.map((e) => e.toJson()).toList(),
      };
}

abstract class ZMKBehaviorParam {
  const ZMKBehaviorParam();
  String getSaved(List<KeymapLayer> layers);
  String getPreview(List<KeymapLayer> layers) => getSaved(layers);
  Map<String, Object?> toJson();
  abstract final ZMKBehaviorParamType type;

  factory ZMKBehaviorParam.fromJson(Map<String, Object?> json) {
    switch (ZMKBehaviorParamType.values.firstWhere((e) => e.name == ( json["type"] as String))) {
      case ZMKBehaviorParamType.keycode:
        return ZMKBehaviorParamKeycode.fromJson(json);
      case ZMKBehaviorParamType.layer:
        return ZMKBehaviorParamLayer.fromJson(json);
      case ZMKBehaviorParamType.options:
        return ZMKBehaviorParamOptions.fromJson(json);
      case ZMKBehaviorParamType.int:
        return ZMKBehaviorParamInt.fromJson(json);
      case ZMKBehaviorParamType.string:
        return ZMKBehaviorParamString.fromJson(json);
      case ZMKBehaviorParamType.color:
        throw UnimplementedError();
        // return ZMKBehaviorParamColor.fromJson(json);
    }
  }

  factory ZMKBehaviorParam.fromType(ZMKBehaviorParamType type) {
    switch (type) {
      case ZMKBehaviorParamType.keycode:
        return ZMKBehaviorParamKeycode(
          keycode: "A",
          modifiers: [],
        );
      case ZMKBehaviorParamType.layer:
        return ZMKBehaviorParamLayer(
          layerId: "",
        );
      case ZMKBehaviorParamType.options:
        return ZMKBehaviorParamOptions(
          selected: "x",
        );
      case ZMKBehaviorParamType.int:
        return ZMKBehaviorParamInt(
          val: 0,
        );
      case ZMKBehaviorParamType.string:
        return ZMKBehaviorParamString(
          val: "",
        );
      case ZMKBehaviorParamType.color:
        throw UnimplementedError();
        // return ZMKBehaviorParamColor(
        //   color: "",
        // );
    }
  }
}

class ZMKBehaviorParamKeycode extends ZMKBehaviorParam {
  const ZMKBehaviorParamKeycode({
    required this.keycode,
    required this.modifiers,
  });

  final String keycode;
  final List<String> modifiers;

  @override
  String getSaved(List<KeymapLayer> layers) {
    return modifiers.map((mod) => "$mod(").join("") +
        keycode +
        (")" * modifiers.length);
  }

  @override
  String getPreview(List<KeymapLayer> layers) {
    final dataModifiers = {
      "LC": "⌃",
      "LS": "⇧",
      "LA": "⌥",
      "LG": "⌘",
      "RC": "⌃",
      "RS": "⇧",
      "RA": "⌥",
      "RG": "⌘",
    };

    return modifiers.map((mod) => "${dataModifiers[mod]} ").join("") +
        keycode;
  }

  ZMKBehaviorParamType get type => ZMKBehaviorParamType.keycode;

  Map<String, Object?> toJson() {
    return {
      "type": type.name,
      "keycode": keycode,
      "modifiers": modifiers,
    };
  }

  factory ZMKBehaviorParamKeycode.fromJson(Map<String, Object?> json) {
    return ZMKBehaviorParamKeycode(
      keycode: json["keycode"] as String,
      modifiers:
          (json["modifiers"] as List<Object?>).map((e) => e as String).toList(),
    );
  }
}

class ZMKBehaviorParamLayer extends ZMKBehaviorParam {
  const ZMKBehaviorParamLayer({
    required this.layerId,
  });

  final String layerId;

  @override
  String getSaved(List<KeymapLayer> layers) {
    return layers.indexWhere((layer) => layer.id == layerId).toString();
  }
  
  @override
  String getPreview(List<KeymapLayer> layers) {
    return layers.firstWhereOrNull((layer) => layer.id == layerId)?.name ?? "";
  }

  ZMKBehaviorParamType get type => ZMKBehaviorParamType.layer;

  Map<String, Object?> toJson() {
    return {
      "type": type.name,
      "layerId": layerId,
    };
  }

  factory ZMKBehaviorParamLayer.fromJson(Map<String, Object?> json) {
    return ZMKBehaviorParamLayer(
      layerId: json["layerId"] as String,
    );
  }
}

class ZMKBehaviorParamInt extends ZMKBehaviorParam {
  const ZMKBehaviorParamInt({
    required this.val,
  });

  final int val;

  @override
  String getSaved(List<KeymapLayer> layers) {
    return val.toString();
  }

  ZMKBehaviorParamType get type => ZMKBehaviorParamType.int;

  Map<String, Object?> toJson() {
    return {
      "type": type.name,
      "val": val,
    };
  }

  factory ZMKBehaviorParamInt.fromJson(Map<String, Object?> json) {
    return ZMKBehaviorParamInt(
      val: json["val"] as int,
    );
  }
}

class ZMKBehaviorParamString extends ZMKBehaviorParam {
  const ZMKBehaviorParamString({
    required this.val,
  });

  final String val;

  @override
  String getSaved(List<KeymapLayer> layers) {
    return val;
  }

  ZMKBehaviorParamType get type => ZMKBehaviorParamType.string;

  Map<String, Object?> toJson() {
    return {
      "type": type.name,
      "val": val,
    };
  }

  factory ZMKBehaviorParamString.fromJson(Map<String, Object?> json) {
    return ZMKBehaviorParamString(
      val: json["val"] as String,
    );
  }
}

class ZMKBehaviorParamOptions extends ZMKBehaviorParam {
  const ZMKBehaviorParamOptions({
    required this.selected,
  });

  final String selected;

  @override
  String getSaved(List<KeymapLayer> layers) {
    return selected;
  }

  ZMKBehaviorParamType get type => ZMKBehaviorParamType.options;

  Map<String, Object?> toJson() {
    return {
      "type": type.name,
      "selected": selected,
    };
  }

  factory ZMKBehaviorParamOptions.fromJson(Map<String, Object?> json) {
    return ZMKBehaviorParamOptions(
      selected: json["selected"] as String,
    );
  }
}
