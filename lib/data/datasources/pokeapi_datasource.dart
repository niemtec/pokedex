import 'package:http/http.dart' as http;

abstract class PokeapiDatasource {
  Future<String> getPokemonByName(String name);
  //TODO: implement remaining methods
}

class PokeapiDatasourceImpl implements PokeapiDatasource {
  final http.Client client;

  PokeapiDatasourceImpl(this.client);

  @override
  Future<String> getPokemonByName(String name) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
