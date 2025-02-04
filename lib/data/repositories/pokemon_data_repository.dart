import 'package:pokedex/data/datasources/pokeapi_datasource.dart';
import 'package:pokedex/data/mappers/pokemon_mapper.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonDataRepositoryImpl implements PokemonRepository {
  final PokeapiDatasource datasource;

  PokemonDataRepositoryImpl(this.datasource);

  @override
  Future<List<Pokemon>> getPokemons({required int offset}) async {
    return PokemonMapper.toDomain(
      await datasource.getPokemons(offset: offset),
    );
  }
}
