// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keymap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeymapLayer _$$_KeymapLayerFromJson(Map<String, dynamic> json) =>
    _$_KeymapLayer(
      name: json['name'] as String,
      id: json['id'] as String,
      keys: (json['keys'] as List<dynamic>)
          .map((e) => ZMKBehavior.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KeymapLayerToJson(_$_KeymapLayer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'keys': instance.keys,
    };

_$_Keymap _$$_KeymapFromJson(Map<String, dynamic> json) => _$_Keymap(
      name: json['name'] as String,
      layers: (json['layers'] as List<dynamic>)
          .map((e) => KeymapLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KeymapToJson(_$_Keymap instance) => <String, dynamic>{
      'name': instance.name,
      'layers': instance.layers,
    };
