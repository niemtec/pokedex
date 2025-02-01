import 'package:pokedex/data/models/pokemon_profile_model.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';

class PokemonProfileModelMapper {
  static List<PokemonProfile> toDomain(List<PokemonProfileModel> pokemonList) {
    List<PokemonProfile> pokemonProfileList = [];

    for (var pokemon in pokemonList) {
      pokemonProfileList.add(PokemonProfile(
        name: pokemon.name,
        imageUrl: pokemon.imageUrl,
      ));
    }

    return pokemonProfileList;
  }
}
