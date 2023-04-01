// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LayoutKey _$LayoutKeyFromJson(Map<String, dynamic> json) {
  return _LayoutKey.fromJson(json);
}

/// @nodoc
mixin _$LayoutKey {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  @JsonKey(name: 'r')
  double get rotation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LayoutKeyCopyWith<LayoutKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutKeyCopyWith<$Res> {
  factory $LayoutKeyCopyWith(LayoutKey value, $Res Function(LayoutKey) then) =
      _$LayoutKeyCopyWithImpl<$Res, LayoutKey>;
  @useResult
  $Res call({double x, double y, @JsonKey(name: 'r') double rotation});
}

/// @nodoc
class _$LayoutKeyCopyWithImpl<$Res, $Val extends LayoutKey>
    implements $LayoutKeyCopyWith<$Res> {
  _$LayoutKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? rotation = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LayoutKeyCopyWith<$Res> implements $LayoutKeyCopyWith<$Res> {
  factory _$$_LayoutKeyCopyWith(
          _$_LayoutKey value, $Res Function(_$_LayoutKey) then) =
      __$$_LayoutKeyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, @JsonKey(name: 'r') double rotation});
}

/// @nodoc
class __$$_LayoutKeyCopyWithImpl<$Res>
    extends _$LayoutKeyCopyWithImpl<$Res, _$_LayoutKey>
    implements _$$_LayoutKeyCopyWith<$Res> {
  __$$_LayoutKeyCopyWithImpl(
      _$_LayoutKey _value, $Res Function(_$_LayoutKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? rotation = null,
  }) {
    return _then(_$_LayoutKey(
      null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LayoutKey implements _LayoutKey {
  const _$_LayoutKey(this.x, this.y, @JsonKey(name: 'r') this.rotation);

  factory _$_LayoutKey.fromJson(Map<String, dynamic> json) =>
      _$$_LayoutKeyFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  @JsonKey(name: 'r')
  final double rotation;

  @override
  String toString() {
    return 'LayoutKey(x: $x, y: $y, rotation: $rotation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LayoutKey &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, rotation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LayoutKeyCopyWith<_$_LayoutKey> get copyWith =>
      __$$_LayoutKeyCopyWithImpl<_$_LayoutKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LayoutKeyToJson(
      this,
    );
  }
}

abstract class _LayoutKey implements LayoutKey {
  const factory _LayoutKey(final double x, final double y,
      @JsonKey(name: 'r') final double rotation) = _$_LayoutKey;

  factory _LayoutKey.fromJson(Map<String, dynamic> json) =
      _$_LayoutKey.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  @JsonKey(name: 'r')
  double get rotation;
  @override
  @JsonKey(ignore: true)
  _$$_LayoutKeyCopyWith<_$_LayoutKey> get copyWith =>
      throw _privateConstructorUsedError;
}

Layout _$LayoutFromJson(Map<String, dynamic> json) {
  return _Layout.fromJson(json);
}

/// @nodoc
mixin _$Layout {
  String get name => throw _privateConstructorUsedError;
  List<LayoutKey> get keys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LayoutCopyWith<Layout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutCopyWith<$Res> {
  factory $LayoutCopyWith(Layout value, $Res Function(Layout) then) =
      _$LayoutCopyWithImpl<$Res, Layout>;
  @useResult
  $Res call({String name, List<LayoutKey> keys});
}

/// @nodoc
class _$LayoutCopyWithImpl<$Res, $Val extends Layout>
    implements $LayoutCopyWith<$Res> {
  _$LayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? keys = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<LayoutKey>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LayoutCopyWith<$Res> implements $LayoutCopyWith<$Res> {
  factory _$$_LayoutCopyWith(_$_Layout value, $Res Function(_$_Layout) then) =
      __$$_LayoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<LayoutKey> keys});
}

/// @nodoc
class __$$_LayoutCopyWithImpl<$Res>
    extends _$LayoutCopyWithImpl<$Res, _$_Layout>
    implements _$$_LayoutCopyWith<$Res> {
  __$$_LayoutCopyWithImpl(_$_Layout _value, $Res Function(_$_Layout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? keys = null,
  }) {
    return _then(_$_Layout(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keys: null == keys
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<LayoutKey>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Layout implements _Layout {
  const _$_Layout({required this.name, required final List<LayoutKey> keys})
      : _keys = keys;

  factory _$_Layout.fromJson(Map<String, dynamic> json) =>
      _$$_LayoutFromJson(json);

  @override
  final String name;
  final List<LayoutKey> _keys;
  @override
  List<LayoutKey> get keys {
    if (_keys is EqualUnmodifiableListView) return _keys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keys);
  }

  @override
  String toString() {
    return 'Layout(name: $name, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Layout &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._keys, _keys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_keys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LayoutCopyWith<_$_Layout> get copyWith =>
      __$$_LayoutCopyWithImpl<_$_Layout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LayoutToJson(
      this,
    );
  }
}

abstract class _Layout implements Layout {
  const factory _Layout(
      {required final String name,
      required final List<LayoutKey> keys}) = _$_Layout;

  factory _Layout.fromJson(Map<String, dynamic> json) = _$_Layout.fromJson;

  @override
  String get name;
  @override
  List<LayoutKey> get keys;
  @override
  @JsonKey(ignore: true)
  _$$_LayoutCopyWith<_$_Layout> get copyWith =>
      throw _privateConstructorUsedError;
}
