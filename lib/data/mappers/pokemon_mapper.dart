import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokeapi_wrapper/pokeapi_wrapper.dart' as api;

class PokemonMapper {
  static Future<List<Pokemon>> toDomain(List<api.Pokemon> pokemonList) async {
    return Future.wait(
      pokemonList.map(
        (pokemon) async => Pokemon(
          id: pokemon.id,
          name: pokemon.name,
          sprite: pokemon.sprites.officialArtWork,
          types: await _mapPokemonTypes(pokemon.types),
          abilities: await _mapPokemonAbilities(pokemon.abilities),
          species: await _mapSpecies(pokemon.species),
          height: pokemon.height,
          weight: pokemon.weight,
        ),
      ),
    );
  }
}

Future<String> _mapSpecies(Future<api.Either<Error, api.PokemonSpecies>> species) async {
  return species.then(
    (result) => result.fold(
      (error) => throw Exception(error),
      (value) => value.genera[7].genus.replaceAll(' Pokémon', ''),
    ),
  );
}

Future<List<String>> _mapPokemonAbilities(List<api.PokemonAbility> abilities) async {
  return Future.wait(
    abilities.map(
      (value) {
        return value.ability.fold(
          (error) => throw Exception(error),
          (ability) => ability.name,
        );
      },
    ),
  );
}

Future<List<PokemonType>> _mapPokemonTypes(List<api.PokemonType> types) async {
  return Future.wait(
    types.map(
      (value) {
        return value.type.fold(
          (error) => throw Exception(error),
          (type) => Future.value(
            PokemonType.values.byName(type.name),
          ), // Wrap in Future
        );
      },
    ),
  );
}
