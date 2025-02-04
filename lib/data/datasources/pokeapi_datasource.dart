import 'package:pokeapi_wrapper/pokeapi_wrapper.dart' as api;

abstract class PokeapiDatasource {
  Future<List<api.Pokemon>> getPokemons({int offset = 0});
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  @override
  Future<List<api.Pokemon>> getPokemons({int offset = 0}) async {
    final pokemonListResponse = await api.PokeApi.getPokemonList(limit: 12, offSet: offset);

    return pokemonListResponse.fold(
      (error) {
        throw Exception("Error fetching Pokémon list: $error");
      },
      (pokemonList) async {
        if (pokemonList.isEmpty) {
          return [];
        }
        final List<Future<api.Pokemon?>> fetchTasks = pokemonList.map((resource) async {
          return await resource.getPokemon().then((response) => response.fold(
                (error) {
                  throw Exception("Error fetching Pokémon details: $error");
                },
                (pokemonDetails) {
                  return pokemonDetails;
                },
              ));
        }).toList();

        // Wait for all fetches to complete
        final result = await Future.wait(fetchTasks);

        // Remove null results and return a clean list
        return result.whereType<api.Pokemon>().toList();
      },
    );
  }
}
