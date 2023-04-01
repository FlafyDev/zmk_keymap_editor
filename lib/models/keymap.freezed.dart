// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keymap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Keymap _$KeymapFromJson(Map<String, dynamic> json) {
  return _Keymap.fromJson(json);
}

/// @nodoc
mixin _$Keymap {
  String get name => throw _privateConstructorUsedError;
  Map<String, List<ZMKBehavior>> get layers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeymapCopyWith<Keymap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeymapCopyWith<$Res> {
  factory $KeymapCopyWith(Keymap value, $Res Function(Keymap) then) =
      _$KeymapCopyWithImpl<$Res, Keymap>;
  @useResult
  $Res call({String name, Map<String, List<ZMKBehavior>> layers});
}

/// @nodoc
class _$KeymapCopyWithImpl<$Res, $Val extends Keymap>
    implements $KeymapCopyWith<$Res> {
  _$KeymapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? layers = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      layers: null == layers
          ? _value.layers
          : layers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ZMKBehavior>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeymapCopyWith<$Res> implements $KeymapCopyWith<$Res> {
  factory _$$_KeymapCopyWith(_$_Keymap value, $Res Function(_$_Keymap) then) =
      __$$_KeymapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Map<String, List<ZMKBehavior>> layers});
}

/// @nodoc
class __$$_KeymapCopyWithImpl<$Res>
    extends _$KeymapCopyWithImpl<$Res, _$_Keymap>
    implements _$$_KeymapCopyWith<$Res> {
  __$$_KeymapCopyWithImpl(_$_Keymap _value, $Res Function(_$_Keymap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? layers = null,
  }) {
    return _then(_$_Keymap(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      layers: null == layers
          ? _value._layers
          : layers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ZMKBehavior>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Keymap implements _Keymap {
  const _$_Keymap(
      {required this.name,
      required final Map<String, List<ZMKBehavior>> layers})
      : _layers = layers;

  factory _$_Keymap.fromJson(Map<String, dynamic> json) =>
      _$$_KeymapFromJson(json);

  @override
  final String name;
  final Map<String, List<ZMKBehavior>> _layers;
  @override
  Map<String, List<ZMKBehavior>> get layers {
    if (_layers is EqualUnmodifiableMapView) return _layers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_layers);
  }

  @override
  String toString() {
    return 'Keymap(name: $name, layers: $layers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Keymap &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._layers, _layers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_layers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeymapCopyWith<_$_Keymap> get copyWith =>
      __$$_KeymapCopyWithImpl<_$_Keymap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeymapToJson(
      this,
    );
  }
}

abstract class _Keymap implements Keymap {
  const factory _Keymap(
      {required final String name,
      required final Map<String, List<ZMKBehavior>> layers}) = _$_Keymap;

  factory _Keymap.fromJson(Map<String, dynamic> json) = _$_Keymap.fromJson;

  @override
  String get name;
  @override
  Map<String, List<ZMKBehavior>> get layers;
  @override
  @JsonKey(ignore: true)
  _$$_KeymapCopyWith<_$_Keymap> get copyWith =>
      throw _privateConstructorUsedError;
}
