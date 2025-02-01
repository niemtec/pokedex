import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonByNameUsecase {
  final PokemonRepository _pokemonRepository;

  GetPokemonByNameUsecase({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  Future<Pokemon> call(String name) async {
    return await _pokemonRepository.getPokemonByName(name);
  }
}
