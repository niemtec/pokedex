class SpriteModel {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final OtherModel other;

  SpriteModel({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
  });

  factory SpriteModel.fromJson(Map<String, dynamic> json) {
    return SpriteModel(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: OtherModel.fromJson(json['other']),
    );
  }
}

class OtherModel {
  final DreamWorldModel dreamWorld;
  final OfficialArtworkModel officialArtwork;

  OtherModel({
    required this.dreamWorld,
    required this.officialArtwork,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      dreamWorld: DreamWorldModel.fromJson(json['dream_world']),
      officialArtwork: OfficialArtworkModel.fromJson(json['official-artwork']),
    );
  }
}

class DreamWorldModel {
  final String frontDefault;
  final String frontFemale;

  DreamWorldModel({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) {
    return DreamWorldModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
    );
  }
}

class OfficialArtworkModel {
  final String frontDefault;

  OfficialArtworkModel({
    required this.frontDefault,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json['front_default'],
    );
  }
}
