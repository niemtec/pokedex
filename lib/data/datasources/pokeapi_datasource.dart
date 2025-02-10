import 'package:pokeapi_wrapper/pokeapi_wrapper.dart' as api;

abstract class PokeapiDatasource {
  Future<List<api.Pokemon>> getPokemons({int offset = 0});
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  @override
  Future<List<api.Pokemon>> getPokemons({int offset = 0}) async {
    final result = await api.PokeApi.getPokemonList(limit: 20, offSet: offset);

    return result.fold(
      (error) => throw Exception("Error fetching Pokémon list: $error"),
      (pokemonList) async {
        if (pokemonList.isEmpty) return [];

        return Future.wait(pokemonList.map((resource) async {
          final response = await resource.getPokemon();
          return response.fold(
            (error) => throw Exception("Error fetching Pokémon details: $error"),
            (pokemonDetails) => pokemonDetails,
          );
        }));
      },
    );
  }
}
