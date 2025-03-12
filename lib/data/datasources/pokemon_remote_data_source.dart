import 'package:pokedex/core/network/graphql_client.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

class PokemonRemoteDataSource {
  final GraphQLService graphQLService;

  PokemonRemoteDataSource({required this.graphQLService});

  Future<List<PokemonModel>> fetchPokemons({required int limit, required int offset}) async {
    const String query = '''
      query GetPokemon(\$limit: Int = 1, \$offset: Int = 0) {
        pokemon_v2_pokemon(limit: \$limit, offset: \$offset) {
          id
          name
          height
          weight
          pokemon_v2_pokemonsprites {
            sprites(path: "other.home.front_shiny")
          }
          pokemon_v2_pokemontypes {
            pokemon_v2_type {
            name
          }
        }
        pokemon_v2_pokemonabilities_aggregate {
          nodes {
            pokemon_v2_ability {
              name
            }
          }
        }
        pokemon_v2_pokemonspecy {
          pokemon_v2_pokemoncolor {
            name
          }
          pokemon_v2_pokemonshape {
            name
          }
          pokemon_v2_pokemonhabitat {
            name
          }
        }
      }
    }
    ''';

    final result = await graphQLService.query(query, variables: {"limit": limit, "offset": offset});

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['pokemon_v2_pokemon'] ?? [];

    return data.map((pokemon) {
      // Extract and transform nested data
      final sprites = pokemon['pokemon_v2_pokemonsprites'] as List;
      final types = (pokemon['pokemon_v2_pokemontypes'] as List?)
              ?.map((type) => type['pokemon_v2_type']['name'] as String)
              .toList() ??
          [];

      final abilities = (pokemon['pokemon_v2_pokemonabilities_aggregate']['nodes'] as List?)
              ?.map((ability) => ability['pokemon_v2_ability']['name'] as String)
              .toList() ??
          [];

      final species = pokemon['pokemon_v2_pokemonspecy'];

      return PokemonModel(
        id: pokemon['id'] as int,
        name: pokemon['name'] as String,
        height: pokemon['height'] as int,
        weight: pokemon['weight'] as int,
        sprite: sprites.isNotEmpty ? sprites.first['sprites'] as String? ?? '' : '',
        types: types,
        abilities: abilities,
        color: species?['pokemon_v2_pokemoncolor']?['name'] as String? ?? '',
        shape: species?['pokemon_v2_pokemonshape']?['name'] as String? ?? '',
        habitat: species?['pokemon_v2_pokemonhabitat']?['name'] as String? ?? '',
      );
    }).toList();
  }
}
