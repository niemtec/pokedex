import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/domain/entities/pokemon_summary.dart';

abstract class PokemonRepository {
  Future<List<PokemonSummary>> getPokemonList(int offset);
  Future<PokemonDetails> getPokemonDetailsByName({required String pokemonName});
}
