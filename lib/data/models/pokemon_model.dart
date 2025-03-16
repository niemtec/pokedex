import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
sealed class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    @Default('') String sprite,
    @Default([]) List<String> types,
    @Default([]) List<String> abilities,
    @Default('') String color,
    @Default('') String shape,
    @Default('') String habitat,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
