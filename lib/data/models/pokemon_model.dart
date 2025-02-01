import 'package:pokedex/data/models/ability_model.dart';
import 'package:pokedex/data/models/cry_model.dart';
import 'package:pokedex/data/models/form_model.dart';
import 'package:pokedex/data/models/game_index_model.dart';
import 'package:pokedex/data/models/held_item_model.dart';
import 'package:pokedex/data/models/move_model.dart';
import 'package:pokedex/data/models/type_model.dart';
import 'package:pokedex/data/models/species_model.dart';
import 'package:pokedex/data/models/sprite_model.dart';
import 'package:pokedex/data/models/stat_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final int order;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<AbilityModel> abilities;
  final int baseExperience;
  final List<CryModel> cries;
  final List<FormModel> forms;
  final List<GameIndexModel> gameIndices;
  final int height;
  final List<HeldItemModel> heldItems;
  final List<MoveModel> moves;
  final List<AbilityModel> pastAbilities;
  final List<TypeModel> pastTypes;
  final SpeciesModel species;
  final SpriteModel sprite;
  final List<StatModel> stats;
  final List<TypeModel> types;
  final int weight;

  PokemonModel({
    required this.id,
    required this.name,
    required this.order,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.moves,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprite,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      isDefault: json['is_default'],
      locationAreaEncounters: json['location_area_encounters'],
      abilities:
          (json['abilities'] as List).map((ability) => AbilityModel.fromJson(ability)).toList(),
      baseExperience: json['base_experience'],
      cries: (json['cries'] as List).map((cry) => CryModel.fromJson(cry)).toList(),
      forms: (json['forms'] as List).map((form) => FormModel.fromJson(form)).toList(),
      gameIndices: (json['game_indices'] as List)
          .map((gameIndex) => GameIndexModel.fromJson(gameIndex))
          .toList(),
      height: json['height'],
      heldItems:
          (json['held_items'] as List).map((heldItem) => HeldItemModel.fromJson(heldItem)).toList(),
      moves: (json['moves'] as List).map((move) => MoveModel.fromJson(move)).toList(),
      pastAbilities: (json['past_abilities'] as List)
          .map((ability) => AbilityModel.fromJson(ability))
          .toList(),
      pastTypes: (json['past_types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
      species: SpeciesModel.fromJson(json['species']),
      sprite: SpriteModel.fromJson(json['sprite']),
      stats: (json['stats'] as List).map((stat) => StatModel.fromJson(stat)).toList(),
      types: (json['types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
      weight: json['weight'],
    );
  }
}
