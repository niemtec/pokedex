import 'package:pokedex/data/models/pokemon_summary_model.dart';
import 'package:pokedex/domain/entities/pokemon_summary.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokemonSummaryMapper {
  static List<PokemonSummary> toDomain(List<PokemonSummaryModel> pokemonList) {
    List<PokemonSummary> pokemonProfileList = [];

    for (var pokemon in pokemonList) {
      pokemonProfileList.add(PokemonSummary(
        id: pokemon.id,
        name: pokemon.name,
        imageUrl: pokemon.imageUrl,
        types: _mapPokemonTypes(pokemon.types),
        abilities: pokemon.abilities,
      ));
    }
    return pokemonProfileList;
  }
}

List<PokemonType> _mapPokemonTypes(List<String> types) {
  List<PokemonType> pokemonTypes = [];

  for (var type in types) {
    pokemonTypes.add(_getPokemonType(type));
  }

  return pokemonTypes;
}

PokemonType _getPokemonType(String type) {
  return switch (type) {
    'normal' => PokemonType.normal,
    'fighting' => PokemonType.fighting,
    'flying' => PokemonType.flying,
    'poison' => PokemonType.poison,
    'ground' => PokemonType.ground,
    'rock' => PokemonType.rock,
    'bug' => PokemonType.bug,
    'ghost' => PokemonType.ghost,
    'steel' => PokemonType.steel,
    'fire' => PokemonType.fire,
    'water' => PokemonType.water,
    'grass' => PokemonType.grass,
    'electric' => PokemonType.electric,
    'psychic' => PokemonType.psychic,
    'ice' => PokemonType.ice,
    'dragon' => PokemonType.dragon,
    'dark' => PokemonType.dark,
    'fairy' => PokemonType.fairy,
    'unknown' => PokemonType.unknown,
    'shadow' => PokemonType.shadow,
    _ => PokemonType.unknown
  };
}
