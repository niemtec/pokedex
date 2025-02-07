import 'package:pokedex/domain/entities/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final List<PokemonType> types;
  final List<String> abilities;
  final String species;
  final int height;
  final int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.types,
    required this.abilities,
    required this.species,
    required this.height,
    required this.weight,
  });
}
