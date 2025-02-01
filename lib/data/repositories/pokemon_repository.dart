import 'package:pokedex/domain/entities/pokemon.dart';

import '../datasources/pokeapi_datasource.dart';

class PokemonRepositoryImpl implements PokeapiDatasource {
  final PokeapiDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Pokemon> getPokemonByName(String name) async {
    return datasource.getPokemonByName(name);
  }
}
