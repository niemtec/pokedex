class PokemonProfileModel {
  final String name;
  final String imageUrl;

  PokemonProfileModel({
    required this.name,
    required this.imageUrl,
  });

  factory PokemonProfileModel.fromJson(Map<String, dynamic> json) {
    return PokemonProfileModel(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
    );
  }
}
