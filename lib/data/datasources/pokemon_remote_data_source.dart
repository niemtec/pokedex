import 'package:flutter/material.dart';
import 'package:pokedex/core/cache/cache_service.dart';
import 'package:pokedex/core/network/graphql_client.dart';
import 'package:pokedex/data/datasources/pokemon_exception.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemons({
    required int limit,
    required int offset,
    bool forceRefresh = false,
  });
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  static const String _pokemonQuery = '''
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

  final GraphQLService graphQLService;
  final CacheService cacheService;

  const PokemonRemoteDataSourceImpl({
    required this.graphQLService,
    required this.cacheService,
  });

  @override
  Future<List<PokemonModel>> fetchPokemons({
    required int limit,
    required int offset,
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get cached data first
      if (!forceRefresh) {
        final cachedData = await cacheService.getCachedPokemonData();
        if (cachedData != null) {
          return cachedData
              .map((pokemon) => _mapToPokemonModel(pokemon))
              .toList();
        }
      }

      // If no cache or force refresh, fetch from network
      final result = await graphQLService.query(
        _pokemonQuery,
        variables: {"limit": limit, "offset": offset},
      );

      if (result.hasException) {
        debugPrint('GraphQL Error: ${result.exception?.graphqlErrors}');
        debugPrint('Network Error: ${result.exception?.linkException}');
        throw QueryException(
            'GraphQL query failed: ${result.exception?.toString() ?? "Unknown error"}');
      }

      if (result.data == null) {
        throw const DataNotFoundException('Query returned null data');
      }

      final List<dynamic>? pokemonData = result.data?['pokemon_v2_pokemon'];

      if (pokemonData == null || pokemonData.isEmpty) {
        throw const DataNotFoundException('No Pokemon data found in response');
      }

      // Cache the new data
      await cacheService.cachePokemonData(
        List<Map<String, dynamic>>.from(pokemonData),
      );

      return pokemonData.map((pokemon) {
        try {
          return _mapToPokemonModel(pokemon);
        } catch (e, stackTrace) {
          debugPrint('Pokemon parsing error: $e');
          debugPrint('Stack trace: $stackTrace');
          throw DataParsingException(
              'Failed to parse Pokemon: ${pokemon['name'] ?? 'unknown'}: $e');
        }
      }).toList();
    } on QueryException {
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('Unexpected error: $e');
      debugPrint('Stack trace: $stackTrace');
      throw DataParsingException('Failed to fetch Pokemon data: $e');
    }
  }

  PokemonModel _mapToPokemonModel(dynamic pokemon) {
    try {
      final sprites = _extractList(pokemon, 'pokemon_v2_pokemonsprites');
      final types = _extractTypes(pokemon);
      final abilities = _extractAbilities(pokemon);
      final species = pokemon['pokemon_v2_pokemonspecy'];

      return PokemonModel(
        id: _extractInt(pokemon, 'id'),
        name: _extractString(pokemon, 'name'),
        height: _extractInt(pokemon, 'height'),
        weight: _extractInt(pokemon, 'weight'),
        sprite:
            sprites.isNotEmpty ? _extractString(sprites.first, 'sprites') : '',
        types: types,
        abilities: abilities,
        color:
            _extractNestedString(species, ['pokemon_v2_pokemoncolor', 'name']),
        shape:
            _extractNestedString(species, ['pokemon_v2_pokemonshape', 'name']),
        habitat: _extractNestedString(
            species, ['pokemon_v2_pokemonhabitat', 'name']),
      );
    } catch (e) {
      throw DataParsingException('Failed to parse Pokemon model: $e');
    }
  }

  List<String> _extractTypes(dynamic pokemon) {
    final typesList = _extractList(pokemon, 'pokemon_v2_pokemontypes');
    return typesList
        .map((type) => _extractNestedString(type, ['pokemon_v2_type', 'name']))
        .where((type) => type.isNotEmpty)
        .toList();
  }

  List<String> _extractAbilities(dynamic pokemon) {
    final nodes = _extractList(
      pokemon['pokemon_v2_pokemonabilities_aggregate'],
      'nodes',
    );
    return nodes
        .map((node) =>
            _extractNestedString(node, ['pokemon_v2_ability', 'name']))
        .where((ability) => ability.isNotEmpty)
        .toList();
  }

  List<dynamic> _extractList(dynamic data, String key) {
    return (data[key] as List?) ?? [];
  }

  String _extractString(dynamic data, String key) {
    return data[key]?.toString() ?? '';
  }

  int _extractInt(dynamic data, String key) {
    return (data[key] as num?)?.toInt() ?? 0;
  }

  String _extractNestedString(dynamic data, List<String> keys) {
    var current = data;
    for (final key in keys) {
      current = current?[key];
      if (current == null) return '';
    }
    return current?.toString() ?? '';
  }
}
