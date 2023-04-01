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

  List<String> toJson() => [
        code,
        ...params,
      ];
}

@freezed
class Keymap with _$Keymap {
  const factory Keymap({
    required String name,
    required Map<String, List<ZMKBehavior>> layers,
  }) = _Keymap;

  factory Keymap.fromJson(Map<String, Object?> json) => _$KeymapFromJson(json);
}
