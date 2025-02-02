import 'dart:convert';

class PokemonSummaryModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  PokemonSummaryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
  });

  factory PokemonSummaryModel.fromJson(Map<String, dynamic> jsonModel) {
    return PokemonSummaryModel(
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

  static List<PokemonSummaryModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PokemonSummaryModel.fromJson(json)).toList();
  }
}
