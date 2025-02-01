import 'package:pokedex/data/models/ability.dart';
import 'package:pokedex/data/models/cry.dart';
import 'package:pokedex/data/models/form.dart';
import 'package:pokedex/data/models/game_index.dart';
import 'package:pokedex/data/models/held_item.dart';
import 'package:pokedex/data/models/move.dart';
import 'package:pokedex/data/models/pokemon_type.dart';
import 'package:pokedex/data/models/species.dart';
import 'package:pokedex/data/models/sprite.dart';
import 'package:pokedex/data/models/stat.dart';

class Pokemon {
  final int id;
  final String name;
  final int order;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Ability> abilities;
  final int baseExperience;
  final List<Cry> cries;
  final List<Form> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final List<Move> moves;
  final List<Ability> pastAbilities;
  final List<PokemonType> pastTypes;
  final Species species;
  final Sprite sprite;
  final List<Stat> stats;
  final List<PokemonType> types;
  final int weight;

  Pokemon({
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
}
