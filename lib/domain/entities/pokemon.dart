import 'package:pokedex/data/models/pokemon_model.dart';

class Pokemon {
  final int id;
  final String name;
  final int order;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Ability> abilities;
  final int baseExperience;
  final List<Cry> cries;
  final List<Form> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final List<Move> moves;
  final List<Ability> pastAbilities;
  final List<PokemonType> pastTypes;
  final Species species;
  final Sprite sprite;
  final List<Stat> stats;
  final List<PokemonType> types;
  final int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.order,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.moves,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprite,
    required this.stats,
    required this.types,
    required this.weight,
  });
}

class Ability {
  final String name;
  final String url;
  final bool isHidden;
  final int slot;

  Ability({
    required this.name,
    required this.url,
    required this.isHidden,
    required this.slot,
  });
}

class Cry {
  final String latest;
  final String legacy;

  Cry({
    required this.latest,
    required this.legacy,
  });
}

class Form {
  final String name;
  final String url;

  Form({
    required this.name,
    required this.url,
  });
}

class GameIndex {
  final int gameIndex;
  final Version version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });
}

class HeldItem {
  final String name;
  final String url;
  final VersionDetails versionDetails;

  HeldItem({
    required this.name,
    required this.url,
    required this.versionDetails,
  });
}

class Version {
  final String name;
  final String url;

  Version({
    required this.name,
    required this.url,
  });
}

class Move {
  final String name;
  final String url;

  Move({
    required this.name,
    required this.url,
  });
}

class PokemonType {
  final String name;
  final String url;

  PokemonType({
    required this.name,
    required this.url,
  });
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });
}

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

class Stat {
  final int baseStat;
  final int effort;
  final String name;
  final String url;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.name,
    required this.url,
  });
}
