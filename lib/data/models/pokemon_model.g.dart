// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonModelImpl _$$PokemonModelImplFromJson(Map<String, dynamic> json) =>
    _$PokemonModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      sprite: json['sprite'] as String? ?? '',
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      color: json['color'] as String? ?? '',
      shape: json['shape'] as String? ?? '',
      habitat: json['habitat'] as String? ?? '',
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'sprite': instance.sprite,
      'types': instance.types,
      'abilities': instance.abilities,
      'color': instance.color,
      'shape': instance.shape,
      'habitat': instance.habitat,
    };
