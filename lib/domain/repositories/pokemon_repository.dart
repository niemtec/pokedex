import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';

abstract class PokemonRepository {
  Future<List<PokemonProfile>> getPokemonList(int offset);
  Future<Pokemon> getPokemonByName(String name);
}
