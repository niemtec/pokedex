import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/mappers/pokemon_model_mapper.dart';
import 'package:pokedex/data/mappers/pokemon_profile_model_mapper.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/data/models/pokemon_profile_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';

abstract class PokeapiDatasource {
  Future<Pokemon> getPokemonByName(String name);
  Future<List<PokemonProfile>> getPokemonList({int offset = 0});
  //TODO: implement remaining methods
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  final http.Client client;

  PokeapiDatasourceImpl(this.client);

  @override
  Future<List<PokemonProfile>> getPokemonList({int offset = 0}) async {
    final response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10&offset=$offset'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      List<PokemonProfileModel> pokemonList = [];

      for (var result in results) {
        final pokemonResponse = await client.get(Uri.parse(result['url']));
        if (pokemonResponse.statusCode == 200) {
          final pokemonJson = json.decode(pokemonResponse.body);
          final pokemonModel = PokemonProfileModel.fromJson(pokemonJson);
          pokemonList.add(pokemonModel);
        } else {
          throw Exception('Failed to load pokemon list');
        }
      }
      return PokemonProfileModelMapper.toDomain(pokemonList);
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }

  @override
  Future<Pokemon> getPokemonByName(String name) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final pokemonModel = PokemonModel.fromJson(json);
      return PokemonModelMapper.toDomain(pokemonModel);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
