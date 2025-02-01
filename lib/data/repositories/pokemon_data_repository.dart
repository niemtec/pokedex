import 'package:pokedex/data/datasources/pokeapi_datasource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonDataRepositoryImpl implements PokemonRepository {
  final PokeapiDatasource datasource;

  PokemonDataRepositoryImpl(this.datasource);

  @override
  Future<List<PokemonProfile>> getPokemonList(int offset) async {
    return datasource.getPokemonList(offset: offset);
  }

  @override
  Future<Pokemon> getPokemonByName(String name) {
    // TODO: implement getPokemonByName
    throw UnimplementedError();
  }
}
