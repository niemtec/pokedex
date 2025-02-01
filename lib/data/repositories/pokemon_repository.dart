import '../datasources/pokeapi_datasource.dart';

class PokemonRepositoryImpl implements PokeapiDatasource {
  final PokeapiDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<String> getPokemonByName(String name) async {
    return datasource.getPokemonByName(name);
  }
}
