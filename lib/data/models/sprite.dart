class Sprite {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final Other other;

  Sprite({
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
}

class Other {
  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.officialArtwork,
  });
}

class DreamWorld {
  final String frontDefault;
  final String frontFemale;

  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });
}

class OfficialArtwork {
  final String frontDefault;

  OfficialArtwork({
    required this.frontDefault,
  });
}
