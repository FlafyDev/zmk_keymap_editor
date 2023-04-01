import 'package:freezed_annotation/freezed_annotation.dart';

part 'zmk_data.freezed.dart';
part 'zmk_data.g.dart';

enum ZMKBehaviorParamType {
  @JsonValue("keycode") keycode,
  @JsonValue("layer") layer,
  @JsonValue("ext1") ext1,
  @JsonValue("int") int,
  @JsonValue("string") string,
  @JsonValue("color") color,
}

@freezed
class ZMKDataBehavior with _$ZMKDataBehavior {
  const factory ZMKDataBehavior({
    required String code,
    required String name,
    required List<String>? includes,
    required List<ZMKBehaviorParamType> params,
    required Map<String, ZMKDataBehaviorExternalParam?>? ext1,
  }) = _ZMKDataBehavior;

  factory ZMKDataBehavior.fromJson(Map<String, Object?> json) =>
      _$ZMKDataBehaviorFromJson(json);
}

@freezed
class ZMKDataBehaviorExternalParam with _$ZMKDataBehaviorExternalParam {
  const factory ZMKDataBehaviorExternalParam({
    required List<ZMKBehaviorParamType>? params,
  }) = _ZMKDataBehaviorExternalParam;

  factory ZMKDataBehaviorExternalParam.fromJson(Map<String, Object?> json) =>
      _$ZMKDataBehaviorExternalParamFromJson(json);
}
