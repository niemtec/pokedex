import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/mappers/pokemon_model_mapper.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokeapiDatasource {
  Future<Pokemon> getPokemonByName(String name);
  //TODO: implement remaining methods
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  final http.Client client;

  PokeapiDatasourceImpl(this.client);

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
