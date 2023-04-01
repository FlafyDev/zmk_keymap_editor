// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LayoutKey _$$_LayoutKeyFromJson(Map<String, dynamic> json) => _$_LayoutKey(
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      (json['r'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LayoutKeyToJson(_$_LayoutKey instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'r': instance.rotation,
    };

_$_Layout _$$_LayoutFromJson(Map<String, dynamic> json) => _$_Layout(
      name: json['name'] as String,
      keys: (json['keys'] as List<dynamic>)
          .map((e) => LayoutKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LayoutToJson(_$_Layout instance) => <String, dynamic>{
      'name': instance.name,
      'keys': instance.keys,
    };
