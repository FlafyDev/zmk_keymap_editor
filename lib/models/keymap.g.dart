// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keymap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keymap _$$_KeymapFromJson(Map<String, dynamic> json) => _$_Keymap(
      name: json['name'] as String,
      layers: (json['layers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ZMKBehavior.fromJson(
                    (e as List<dynamic>).map((e) => e as String).toList()))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_KeymapToJson(_$_Keymap instance) => <String, dynamic>{
      'name': instance.name,
      'layers': instance.layers,
    };
