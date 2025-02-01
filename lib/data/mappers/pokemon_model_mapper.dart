import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokemonModelMapper {
  static Pokemon toDomain(PokemonModel pokemonModel) {
    return Pokemon(
      id: pokemonModel.id ?? '',
      name: pokemonModel.name ?? "",
      imageUrl: pokemonModel.sprites!.frontDefault.toString(),
      types: _mapType(pokemonModel.types ?? []),
      abilities: _mapAbilities(pokemonModel.abilities ?? []),
    );
  }
}

List<PokemonType> _mapType(List<Types> types) {
  List<PokemonType> pokemonTypes = [];

  for (var type in types) {
    pokemonTypes.add(_getType(type));
  }

  return pokemonTypes;
}

List<String> _mapAbilities(List<Abilities> abilities) {
  List<String> pokemonAbilities = [];

  for (var ability in abilities) {
    pokemonAbilities.add(ability.ability?.name ?? "");
  }

  return pokemonAbilities;
}

PokemonType _getType(Types type) {
  switch (type.type!.name) {
    case 'normal':
      return PokemonType.normal;
    case 'fighting':
      return PokemonType.fighting;
    case 'flying':
      return PokemonType.flying;
    case 'poison':
      return PokemonType.poison;
    case 'ground':
      return PokemonType.ground;
    case 'rock':
      return PokemonType.rock;
    case 'bug':
      return PokemonType.bug;
    case 'ghost':
      return PokemonType.ghost;
    case 'steel':
      return PokemonType.steel;
    case 'fire':
      return PokemonType.fire;
    case 'water':
      return PokemonType.water;
    case 'grass':
      return PokemonType.grass;
    case 'electric':
      return PokemonType.electric;
    case 'psychic':
      return PokemonType.psychic;
    case 'ice':
      return PokemonType.ice;
    case 'dragon':
      return PokemonType.dragon;
    case 'dark':
      return PokemonType.dark;
    case 'fairy':
      return PokemonType.fairy;
    case 'unknown':
      return PokemonType.unknown;
    case 'shadow':
      return PokemonType.shadow;
    default:
      return PokemonType.unknown;
  }
}
