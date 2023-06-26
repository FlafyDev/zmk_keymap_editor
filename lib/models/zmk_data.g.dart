// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zmk_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ZMKDataBehavior _$$_ZMKDataBehaviorFromJson(Map<String, dynamic> json) =>
    _$_ZMKDataBehavior(
      code: json['code'] as String,
      name: json['name'] as String,
      includes: (json['includes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      params: (json['params'] as List<dynamic>)
          .map((e) => $enumDecode(_$ZMKBehaviorParamTypeEnumMap, e))
          .toList(),
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : ZMKDataBehaviorExternalParam.fromJson(
                    e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ZMKDataBehaviorToJson(_$_ZMKDataBehavior instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'includes': instance.includes,
      'params': instance.params
          .map((e) => _$ZMKBehaviorParamTypeEnumMap[e]!)
          .toList(),
      'options': instance.options,
    };

const _$ZMKBehaviorParamTypeEnumMap = {
  ZMKBehaviorParamType.keycode: 'keycode',
  ZMKBehaviorParamType.layer: 'layer',
  ZMKBehaviorParamType.options: 'options',
  ZMKBehaviorParamType.int: 'int',
  ZMKBehaviorParamType.string: 'string',
  ZMKBehaviorParamType.color: 'color',
};

_$_ZMKDataBehaviorExternalParam _$$_ZMKDataBehaviorExternalParamFromJson(
        Map<String, dynamic> json) =>
    _$_ZMKDataBehaviorExternalParam(
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ZMKBehaviorParamTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_ZMKDataBehaviorExternalParamToJson(
        _$_ZMKDataBehaviorExternalParam instance) =>
    <String, dynamic>{
      'params': instance.params
          ?.map((e) => _$ZMKBehaviorParamTypeEnumMap[e]!)
          .toList(),
    };
