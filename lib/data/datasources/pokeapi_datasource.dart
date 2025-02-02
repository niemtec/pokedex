import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/models/pokemon_details_model.dart';
import 'package:pokedex/data/models/pokemon_summary_model.dart';

abstract class PokeapiDatasource {
  // Future<Pokemon> getPokemonByName(String name);
  Future<List<PokemonSummaryModel>> getPokemonList({int offset = 0});
  Future<PokemonDetailsModel> getPokemonDetailsByName({required String pokemonName});
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  final http.Client client;

  PokeapiDatasourceImpl(this.client);

  @override
  Future<List<PokemonSummaryModel>> getPokemonList({int offset = 0}) async {
    List<PokemonSummaryModel> pokemonList = [];

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
          pokemonList.add(PokemonSummaryModel.fromJson(pokemonDetailsData));
        } else {
          throw Exception('Failed to load pokemon list');
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetailsByName({required String pokemonName}) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
