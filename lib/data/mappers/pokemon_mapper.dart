import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokeapi_wrapper/pokeapi_wrapper.dart' as api;

class PokemonMapper {
  static Future<List<Pokemon>> toDomain(List<api.Pokemon> pokemonList) async {
    List<Pokemon> pokemonProfileList = [];

    for (var pokemon in pokemonList) {
      var types = await _mapPokemonTypes(pokemon.types);
      pokemonProfileList.add(
        Pokemon(
          id: pokemon.id,
          name: pokemon.name,
          sprite: pokemon.sprites.officialArtWork,
          types: types,
          abilities: _mapPokemonAbilities(pokemon.abilities),
          accentColour: _getPokemonTypeColour(types.first),
          species: await _mapSpecies(pokemon.species),
        ),
      );
    }
    return pokemonProfileList;
  }
}

Future<String> _mapSpecies(Future<api.Either<Error, api.PokemonSpecies>> species) async {
  String genus = "";

  await species.fold(
    (error) {
      return;
    },
    (value) {
      genus = value.genera[7].genus;
    },
  );
  return genus;
}

List<String> _mapPokemonAbilities(List<api.PokemonAbility> abilities) {
  List<String> pokemonAbilities = [];

  for (var ability in abilities) {
    ability.ability.fold(
      (error) => {
        throw Exception(error),
      },
      (ability) => {
        pokemonAbilities.add(ability.name),
      },
    );
  }
  return pokemonAbilities;
}

Future<List<PokemonType>> _mapPokemonTypes(List<api.PokemonType> types) async {
  List<PokemonType> pokemonTypes = [];

  for (var value in types) {
    await value.type.fold(
      (error) => {
        throw Exception(error),
      },
      (type) => {
        pokemonTypes.add(
          _getPokemonType(type),
        ),
      },
    );
  }

  return pokemonTypes;
}

PokemonType _getPokemonType(api.Type type) {
  return switch (type.name) {
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

Color _getPokemonTypeColour(PokemonType type) {
  switch (type) {
    case PokemonType.normal:
      return const Color(0xFFA8A77A);
    case PokemonType.fire:
      return const Color(0xFFFB6C6C);
    case PokemonType.water:
      return const Color(0xFF91CAFD);
    case PokemonType.grass:
      return const Color(0xFF48D0B0);
    case PokemonType.electric:
      return const Color(0xFFFED86F);
    case PokemonType.ice:
      return const Color(0xFF96D9D6);
    case PokemonType.fighting:
      return const Color(0xFFC22E28);
    case PokemonType.poison:
      return const Color(0xFFA33EA1);
    case PokemonType.ground:
      return const Color(0xFFE2BF65);
    case PokemonType.flying:
      return const Color(0xFFA98FF3);
    case PokemonType.psychic:
      return const Color(0xFFF95587);
    case PokemonType.bug:
      return const Color(0xFFA6B91A);
    case PokemonType.rock:
      return const Color(0xFFB6A136);
    case PokemonType.ghost:
      return const Color(0xFF735797);
    case PokemonType.dragon:
      return const Color(0xFF6F35FC);
    case PokemonType.dark:
      return const Color(0xFF705746);
    case PokemonType.steel:
      return const Color(0xFFB7B7CE);
    case PokemonType.fairy:
      return const Color(0xFFD685AD);
    case PokemonType.shadow:
      return const Color(0xFF5A5A5A);
    case PokemonType.unknown:
      return const Color(0xFF68A090);
  }
}
