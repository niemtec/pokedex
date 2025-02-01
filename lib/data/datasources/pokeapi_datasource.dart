import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/mappers/pokemon_model_mapper.dart';
import 'package:pokedex/data/mappers/pokemon_profile_model_mapper.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/data/models/pokemon_profile_model.dart';
import 'package:pokedex/domain/entities/pokemon_profile.dart';

abstract class PokeapiDatasource {
  // Future<Pokemon> getPokemonByName(String name);
  Future<List<PokemonProfile>> getPokemonList({int offset = 0});
  //TODO: implement remaining methods
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  final http.Client client;

  PokeapiDatasourceImpl(this.client);

  @override
  Future<List<PokemonProfile>> getPokemonList({int offset = 0}) async {
    List<PokemonProfileModel> pokemonList = [];

    final response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=12&offset=$offset'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];

      for (var result in results) {
        final pokemonDetailsResponse =
            await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${result['name']}'));

        if (pokemonDetailsResponse.statusCode == 200) {
          final pokemonDetailsData = json.decode(pokemonDetailsResponse.body);
          pokemonList.add(PokemonProfileModel.fromJson(pokemonDetailsData));
        } else {
          throw Exception('Failed to load pokemon list');
        }
      }
      return PokemonProfileModelMapper.toDomain(pokemonList);
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }

  // @override
  // Future<PokemonModel> getPokemonByName(String name) async {
  //   final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     final pokemonModel = PokemonModel.fromJson(data);
  //     return PokemonModelMapper.toDomain(pokemonModel);
  //   } else {
  //     throw Exception('Failed to load pokemon');
  //   }
  // }
}
