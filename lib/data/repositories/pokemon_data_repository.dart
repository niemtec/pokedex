import 'package:pokedex/data/datasources/pokeapi_datasource.dart';
import 'package:pokedex/data/mappers/pokemon_details_mapper.dart';
import 'package:pokedex/data/mappers/pokemon_summary_mapper.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/domain/entities/pokemon_summary.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonDataRepositoryImpl implements PokemonRepository {
  final PokeapiDatasource datasource;

  PokemonDataRepositoryImpl(this.datasource);

  @override
  Future<List<PokemonSummary>> getPokemonList(int offset) async {
    return PokemonSummaryMapper.toDomain(
      await datasource.getPokemonList(offset: offset),
    );
  }

  @override
  Future<PokemonDetails> getPokemonDetailsByName({required String pokemonName}) async {
    return PokemonDetailsMapper.toDomain(
        await datasource.getPokemonDetailsByName(pokemonName: pokemonName));
  }
}
