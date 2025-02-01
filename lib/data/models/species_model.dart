class SpeciesModel {
  final String name;
  final String url;

  SpeciesModel({
    required this.name,
    required this.url,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
