import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout.freezed.dart';
part 'layout.g.dart';

@freezed
class LayoutKey with _$LayoutKey {
  const factory LayoutKey(
      double x, double y, @JsonKey(name: 'r') double rotation) = _LayoutKey;

  factory LayoutKey.fromJson(Map<String, Object?> json) =>
      _$LayoutKeyFromJson(json);
}

@freezed
class Layout with _$Layout {
  const factory Layout({
    required String name,
    required List<LayoutKey> keys,
  }) = _Layout;

  factory Layout.fromJson(Map<String, Object?> json) => _$LayoutFromJson(json);
}
