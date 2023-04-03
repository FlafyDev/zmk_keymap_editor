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

KeymapLayer _$KeymapLayerFromJson(Map<String, dynamic> json) {
  return _KeymapLayer.fromJson(json);
}

/// @nodoc
mixin _$KeymapLayer {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<ZMKBehavior> get keys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeymapLayerCopyWith<KeymapLayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeymapLayerCopyWith<$Res> {
  factory $KeymapLayerCopyWith(
          KeymapLayer value, $Res Function(KeymapLayer) then) =
      _$KeymapLayerCopyWithImpl<$Res, KeymapLayer>;
  @useResult
  $Res call({String name, String id, List<ZMKBehavior> keys});
}

/// @nodoc
class _$KeymapLayerCopyWithImpl<$Res, $Val extends KeymapLayer>
    implements $KeymapLayerCopyWith<$Res> {
  _$KeymapLayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? keys = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehavior>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeymapLayerCopyWith<$Res>
    implements $KeymapLayerCopyWith<$Res> {
  factory _$$_KeymapLayerCopyWith(
          _$_KeymapLayer value, $Res Function(_$_KeymapLayer) then) =
      __$$_KeymapLayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, List<ZMKBehavior> keys});
}

/// @nodoc
class __$$_KeymapLayerCopyWithImpl<$Res>
    extends _$KeymapLayerCopyWithImpl<$Res, _$_KeymapLayer>
    implements _$$_KeymapLayerCopyWith<$Res> {
  __$$_KeymapLayerCopyWithImpl(
      _$_KeymapLayer _value, $Res Function(_$_KeymapLayer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? keys = null,
  }) {
    return _then(_$_KeymapLayer(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keys: null == keys
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehavior>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeymapLayer implements _KeymapLayer {
  const _$_KeymapLayer(
      {required this.name,
      required this.id,
      required final List<ZMKBehavior> keys})
      : _keys = keys;

  factory _$_KeymapLayer.fromJson(Map<String, dynamic> json) =>
      _$$_KeymapLayerFromJson(json);

  @override
  final String name;
  @override
  final String id;
  final List<ZMKBehavior> _keys;
  @override
  List<ZMKBehavior> get keys {
    if (_keys is EqualUnmodifiableListView) return _keys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keys);
  }

  @override
  String toString() {
    return 'KeymapLayer(name: $name, id: $id, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeymapLayer &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._keys, _keys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, const DeepCollectionEquality().hash(_keys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeymapLayerCopyWith<_$_KeymapLayer> get copyWith =>
      __$$_KeymapLayerCopyWithImpl<_$_KeymapLayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeymapLayerToJson(
      this,
    );
  }
}

abstract class _KeymapLayer implements KeymapLayer {
  const factory _KeymapLayer(
      {required final String name,
      required final String id,
      required final List<ZMKBehavior> keys}) = _$_KeymapLayer;

  factory _KeymapLayer.fromJson(Map<String, dynamic> json) =
      _$_KeymapLayer.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  List<ZMKBehavior> get keys;
  @override
  @JsonKey(ignore: true)
  _$$_KeymapLayerCopyWith<_$_KeymapLayer> get copyWith =>
      throw _privateConstructorUsedError;
}

Keymap _$KeymapFromJson(Map<String, dynamic> json) {
  return _Keymap.fromJson(json);
}

/// @nodoc
mixin _$Keymap {
  String get name => throw _privateConstructorUsedError;
  List<KeymapLayer> get layers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeymapCopyWith<Keymap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeymapCopyWith<$Res> {
  factory $KeymapCopyWith(Keymap value, $Res Function(Keymap) then) =
      _$KeymapCopyWithImpl<$Res, Keymap>;
  @useResult
  $Res call({String name, List<KeymapLayer> layers});
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
              as List<KeymapLayer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeymapCopyWith<$Res> implements $KeymapCopyWith<$Res> {
  factory _$$_KeymapCopyWith(_$_Keymap value, $Res Function(_$_Keymap) then) =
      __$$_KeymapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<KeymapLayer> layers});
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
              as List<KeymapLayer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Keymap extends _Keymap {
  const _$_Keymap({required this.name, required final List<KeymapLayer> layers})
      : _layers = layers,
        super._();

  factory _$_Keymap.fromJson(Map<String, dynamic> json) =>
      _$$_KeymapFromJson(json);

  @override
  final String name;
  final List<KeymapLayer> _layers;
  @override
  List<KeymapLayer> get layers {
    if (_layers is EqualUnmodifiableListView) return _layers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_layers);
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

abstract class _Keymap extends Keymap {
  const factory _Keymap(
      {required final String name,
      required final List<KeymapLayer> layers}) = _$_Keymap;
  const _Keymap._() : super._();

  factory _Keymap.fromJson(Map<String, dynamic> json) = _$_Keymap.fromJson;

  @override
  String get name;
  @override
  List<KeymapLayer> get layers;
  @override
  @JsonKey(ignore: true)
  _$$_KeymapCopyWith<_$_Keymap> get copyWith =>
      throw _privateConstructorUsedError;
}
