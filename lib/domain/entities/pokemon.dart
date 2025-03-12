import 'package:pokedex/domain/entities/height.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/domain/entities/weight.dart';

class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final List<PokemonType> types;
  final List<String> abilities;
  final Height height;
  final Weight weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
  });
}
