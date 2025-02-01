import 'package:pokedex/data/datasources/pokeapi_datasource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';

class PokemonRepositoryImpl implements PokeapiDatasource {
  final PokeapiDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<List<PokemonProfile>> getPokemonList({int offset = 0}) async {
    return datasource.getPokemonList(offset: offset);
  }

  @override
  Future<Pokemon> getPokemonByName(String name) async {
    return datasource.getPokemonByName(name);
  }
}
