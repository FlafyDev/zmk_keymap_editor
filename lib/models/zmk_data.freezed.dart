// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zmk_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZMKDataBehavior _$ZMKDataBehaviorFromJson(Map<String, dynamic> json) {
  return _ZMKDataBehavior.fromJson(json);
}

/// @nodoc
mixin _$ZMKDataBehavior {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String>? get includes => throw _privateConstructorUsedError;
  List<ZMKBehaviorParamType> get params => throw _privateConstructorUsedError;
  Map<String, ZMKDataBehaviorExternalParam?>? get ext1 =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZMKDataBehaviorCopyWith<ZMKDataBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZMKDataBehaviorCopyWith<$Res> {
  factory $ZMKDataBehaviorCopyWith(
          ZMKDataBehavior value, $Res Function(ZMKDataBehavior) then) =
      _$ZMKDataBehaviorCopyWithImpl<$Res, ZMKDataBehavior>;
  @useResult
  $Res call(
      {String code,
      String name,
      List<String>? includes,
      List<ZMKBehaviorParamType> params,
      Map<String, ZMKDataBehaviorExternalParam?>? ext1});
}

/// @nodoc
class _$ZMKDataBehaviorCopyWithImpl<$Res, $Val extends ZMKDataBehavior>
    implements $ZMKDataBehaviorCopyWith<$Res> {
  _$ZMKDataBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? includes = freezed,
    Object? params = null,
    Object? ext1 = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includes: freezed == includes
          ? _value.includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehaviorParamType>,
      ext1: freezed == ext1
          ? _value.ext1
          : ext1 // ignore: cast_nullable_to_non_nullable
              as Map<String, ZMKDataBehaviorExternalParam?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ZMKDataBehaviorCopyWith<$Res>
    implements $ZMKDataBehaviorCopyWith<$Res> {
  factory _$$_ZMKDataBehaviorCopyWith(
          _$_ZMKDataBehavior value, $Res Function(_$_ZMKDataBehavior) then) =
      __$$_ZMKDataBehaviorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      List<String>? includes,
      List<ZMKBehaviorParamType> params,
      Map<String, ZMKDataBehaviorExternalParam?>? ext1});
}

/// @nodoc
class __$$_ZMKDataBehaviorCopyWithImpl<$Res>
    extends _$ZMKDataBehaviorCopyWithImpl<$Res, _$_ZMKDataBehavior>
    implements _$$_ZMKDataBehaviorCopyWith<$Res> {
  __$$_ZMKDataBehaviorCopyWithImpl(
      _$_ZMKDataBehavior _value, $Res Function(_$_ZMKDataBehavior) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? includes = freezed,
    Object? params = null,
    Object? ext1 = freezed,
  }) {
    return _then(_$_ZMKDataBehavior(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includes: freezed == includes
          ? _value._includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehaviorParamType>,
      ext1: freezed == ext1
          ? _value._ext1
          : ext1 // ignore: cast_nullable_to_non_nullable
              as Map<String, ZMKDataBehaviorExternalParam?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ZMKDataBehavior implements _ZMKDataBehavior {
  const _$_ZMKDataBehavior(
      {required this.code,
      required this.name,
      required final List<String>? includes,
      required final List<ZMKBehaviorParamType> params,
      required final Map<String, ZMKDataBehaviorExternalParam?>? ext1})
      : _includes = includes,
        _params = params,
        _ext1 = ext1;

  factory _$_ZMKDataBehavior.fromJson(Map<String, dynamic> json) =>
      _$$_ZMKDataBehaviorFromJson(json);

  @override
  final String code;
  @override
  final String name;
  final List<String>? _includes;
  @override
  List<String>? get includes {
    final value = _includes;
    if (value == null) return null;
    if (_includes is EqualUnmodifiableListView) return _includes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ZMKBehaviorParamType> _params;
  @override
  List<ZMKBehaviorParamType> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  final Map<String, ZMKDataBehaviorExternalParam?>? _ext1;
  @override
  Map<String, ZMKDataBehaviorExternalParam?>? get ext1 {
    final value = _ext1;
    if (value == null) return null;
    if (_ext1 is EqualUnmodifiableMapView) return _ext1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ZMKDataBehavior(code: $code, name: $name, includes: $includes, params: $params, ext1: $ext1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ZMKDataBehavior &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._includes, _includes) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            const DeepCollectionEquality().equals(other._ext1, _ext1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      const DeepCollectionEquality().hash(_includes),
      const DeepCollectionEquality().hash(_params),
      const DeepCollectionEquality().hash(_ext1));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZMKDataBehaviorCopyWith<_$_ZMKDataBehavior> get copyWith =>
      __$$_ZMKDataBehaviorCopyWithImpl<_$_ZMKDataBehavior>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZMKDataBehaviorToJson(
      this,
    );
  }
}

abstract class _ZMKDataBehavior implements ZMKDataBehavior {
  const factory _ZMKDataBehavior(
          {required final String code,
          required final String name,
          required final List<String>? includes,
          required final List<ZMKBehaviorParamType> params,
          required final Map<String, ZMKDataBehaviorExternalParam?>? ext1}) =
      _$_ZMKDataBehavior;

  factory _ZMKDataBehavior.fromJson(Map<String, dynamic> json) =
      _$_ZMKDataBehavior.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  List<String>? get includes;
  @override
  List<ZMKBehaviorParamType> get params;
  @override
  Map<String, ZMKDataBehaviorExternalParam?>? get ext1;
  @override
  @JsonKey(ignore: true)
  _$$_ZMKDataBehaviorCopyWith<_$_ZMKDataBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

ZMKDataBehaviorExternalParam _$ZMKDataBehaviorExternalParamFromJson(
    Map<String, dynamic> json) {
  return _ZMKDataBehaviorExternalParam.fromJson(json);
}

/// @nodoc
mixin _$ZMKDataBehaviorExternalParam {
  List<ZMKBehaviorParamType>? get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZMKDataBehaviorExternalParamCopyWith<ZMKDataBehaviorExternalParam>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZMKDataBehaviorExternalParamCopyWith<$Res> {
  factory $ZMKDataBehaviorExternalParamCopyWith(
          ZMKDataBehaviorExternalParam value,
          $Res Function(ZMKDataBehaviorExternalParam) then) =
      _$ZMKDataBehaviorExternalParamCopyWithImpl<$Res,
          ZMKDataBehaviorExternalParam>;
  @useResult
  $Res call({List<ZMKBehaviorParamType>? params});
}

/// @nodoc
class _$ZMKDataBehaviorExternalParamCopyWithImpl<$Res,
        $Val extends ZMKDataBehaviorExternalParam>
    implements $ZMKDataBehaviorExternalParamCopyWith<$Res> {
  _$ZMKDataBehaviorExternalParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehaviorParamType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ZMKDataBehaviorExternalParamCopyWith<$Res>
    implements $ZMKDataBehaviorExternalParamCopyWith<$Res> {
  factory _$$_ZMKDataBehaviorExternalParamCopyWith(
          _$_ZMKDataBehaviorExternalParam value,
          $Res Function(_$_ZMKDataBehaviorExternalParam) then) =
      __$$_ZMKDataBehaviorExternalParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ZMKBehaviorParamType>? params});
}

/// @nodoc
class __$$_ZMKDataBehaviorExternalParamCopyWithImpl<$Res>
    extends _$ZMKDataBehaviorExternalParamCopyWithImpl<$Res,
        _$_ZMKDataBehaviorExternalParam>
    implements _$$_ZMKDataBehaviorExternalParamCopyWith<$Res> {
  __$$_ZMKDataBehaviorExternalParamCopyWithImpl(
      _$_ZMKDataBehaviorExternalParam _value,
      $Res Function(_$_ZMKDataBehaviorExternalParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$_ZMKDataBehaviorExternalParam(
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ZMKBehaviorParamType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ZMKDataBehaviorExternalParam implements _ZMKDataBehaviorExternalParam {
  const _$_ZMKDataBehaviorExternalParam(
      {required final List<ZMKBehaviorParamType>? params})
      : _params = params;

  factory _$_ZMKDataBehaviorExternalParam.fromJson(Map<String, dynamic> json) =>
      _$$_ZMKDataBehaviorExternalParamFromJson(json);

  final List<ZMKBehaviorParamType>? _params;
  @override
  List<ZMKBehaviorParamType>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ZMKDataBehaviorExternalParam(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ZMKDataBehaviorExternalParam &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZMKDataBehaviorExternalParamCopyWith<_$_ZMKDataBehaviorExternalParam>
      get copyWith => __$$_ZMKDataBehaviorExternalParamCopyWithImpl<
          _$_ZMKDataBehaviorExternalParam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZMKDataBehaviorExternalParamToJson(
      this,
    );
  }
}

abstract class _ZMKDataBehaviorExternalParam
    implements ZMKDataBehaviorExternalParam {
  const factory _ZMKDataBehaviorExternalParam(
          {required final List<ZMKBehaviorParamType>? params}) =
      _$_ZMKDataBehaviorExternalParam;

  factory _ZMKDataBehaviorExternalParam.fromJson(Map<String, dynamic> json) =
      _$_ZMKDataBehaviorExternalParam.fromJson;

  @override
  List<ZMKBehaviorParamType>? get params;
  @override
  @JsonKey(ignore: true)
  _$$_ZMKDataBehaviorExternalParamCopyWith<_$_ZMKDataBehaviorExternalParam>
      get copyWith => throw _privateConstructorUsedError;
}
