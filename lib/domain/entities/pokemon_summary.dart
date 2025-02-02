import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokemonSummary {
  final String id;
  final String name;
  final String imageUrl;
  final List<PokemonType> types;
  final List<String> abilities;

  PokemonSummary({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
  });
}
