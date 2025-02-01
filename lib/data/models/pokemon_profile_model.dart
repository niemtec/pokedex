import 'dart:convert';

class PokemonProfileModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  PokemonProfileModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
  });

  factory PokemonProfileModel.fromJson(Map<String, dynamic> jsonModel) {
    return PokemonProfileModel(
      id: jsonModel['id'].toString(),
      name: jsonModel['name'],
      // imageUrl: jsonModel['sprites']['front_default'],
      imageUrl: jsonModel['sprites']['other']['home']['front_default'],
      types: (jsonModel['types'] as List)
          .map((typeEntry) => typeEntry['type']['name'] as String)
          .toList(),
      abilities: (jsonModel['abilities'] as List)
          .map((abilityEntry) => abilityEntry['ability']['name'] as String)
          .toList(),
    );
  }

  static List<PokemonProfileModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PokemonProfileModel.fromJson(json)).toList();
  }
}
