import 'package:pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/domain/entities/height.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/domain/entities/weight.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({required int limit, required int offset});
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Pokemon>> getPokemons({required int limit, required int offset}) async {
    try {
      // Fetch data from the remote data source
      List<PokemonModel> models =
          await remoteDataSource.fetchPokemons(limit: limit, offset: offset);

      // Convert models to domain entities
      return models
          .map((model) => Pokemon(
                id: model.id,
                name: model.name,
                sprite: model.sprite,
                types: model.types
                    .map((type) => PokemonType.values
                        .firstWhere((e) => e.name.toLowerCase() == type.toLowerCase()))
                    .toList(),
                abilities: model.abilities,
                height: Height.fromDecimetres(model.height.toDouble()),
                weight: Weight.fromHectograms(model.weight.toDouble()),
              ))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch Pokémon: $e");
    }
  }
}
