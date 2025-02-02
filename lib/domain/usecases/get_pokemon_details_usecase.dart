import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailsUsecase {
  final PokemonRepository _pokemonRepository;

  GetPokemonDetailsUsecase({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  Future<PokemonDetails> call({required String pokemonName}) async {
    return await _pokemonRepository.getPokemonDetailsByName(pokemonName: pokemonName);
  }
}
