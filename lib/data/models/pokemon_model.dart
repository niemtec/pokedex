class PokemonModel {
  final int id;
  final String name;
  final int order;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<AbilityModel> abilities;
  final int baseExperience;
  final List<CryModel> cries;
  final List<FormModel> forms;
  final List<GameIndexModel> gameIndices;
  final int height;
  final List<HeldItemModel> heldItems;
  final List<MoveModel> moves;
  final List<AbilityModel> pastAbilities;
  final List<TypeModel> pastTypes;
  final SpeciesModel species;
  final SpriteModel sprite;
  final List<StatModel> stats;
  final List<TypeModel> types;
  final int weight;

  PokemonModel({
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

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      isDefault: json['is_default'],
      locationAreaEncounters: json['location_area_encounters'],
      abilities:
          (json['abilities'] as List).map((ability) => AbilityModel.fromJson(ability)).toList(),
      baseExperience: json['base_experience'],
      cries: (json['cries'] as List).map((cry) => CryModel.fromJson(cry)).toList(),
      forms: (json['forms'] as List).map((form) => FormModel.fromJson(form)).toList(),
      gameIndices: (json['game_indices'] as List)
          .map((gameIndex) => GameIndexModel.fromJson(gameIndex))
          .toList(),
      height: json['height'],
      heldItems:
          (json['held_items'] as List).map((heldItem) => HeldItemModel.fromJson(heldItem)).toList(),
      moves: (json['moves'] as List).map((move) => MoveModel.fromJson(move)).toList(),
      pastAbilities: (json['past_abilities'] as List)
          .map((ability) => AbilityModel.fromJson(ability))
          .toList(),
      pastTypes: (json['past_types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
      species: SpeciesModel.fromJson(json['species']),
      sprite: SpriteModel.fromJson(json['sprite']),
      stats: (json['stats'] as List).map((stat) => StatModel.fromJson(stat)).toList(),
      types: (json['types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
      weight: json['weight'],
    );
  }
}

class AbilityModel {
  final String name;
  final String url;
  final bool isHidden;
  final int slot;

  AbilityModel({
    required this.name,
    required this.url,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json['ability']['name'],
      url: json['ability']['url'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}

class CryModel {
  final String latest;
  final String legacy;

  CryModel({
    required this.latest,
    required this.legacy,
  });

  factory CryModel.fromJson(Map<String, dynamic> json) {
    return CryModel(
      latest: json['latest'],
      legacy: json['legacy'],
    );
  }
}

class FormModel {
  final String name;
  final String url;

  FormModel({
    required this.name,
    required this.url,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      name: json['name'],
      url: json['url'],
    );
  }
}

class GameIndexModel {
  final int gameIndex;
  final VersionModel version;

  GameIndexModel({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndexModel.fromJson(Map<String, dynamic> json) {
    return GameIndexModel(
      gameIndex: json['game_index'],
      version: VersionModel.fromJson(json['version']),
    );
  }
}

class HeldItemModel {
  final String name;
  final String url;
  final VersionDetails versionDetails;

  HeldItemModel({
    required this.name,
    required this.url,
    required this.versionDetails,
  });

  factory HeldItemModel.fromJson(Map<String, dynamic> json) {
    return HeldItemModel(
      name: json['name'],
      url: json['url'],
      versionDetails: VersionDetails.fromJson(json['version_details']),
    );
  }
}

class MoveLearnMethod {
  final String name;
  final String url;

  MoveLearnMethod({
    required this.name,
    required this.url,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return MoveLearnMethod(
      name: json['name'],
      url: json['url'],
    );
  }
}

class MoveModel {
  final String name;
  final String url;
  final VersionGroupDetails versionGroupDetails;

  MoveModel({
    required this.name,
    required this.url,
    required this.versionGroupDetails,
  });

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      name: json['name'],
      url: json['url'],
      versionGroupDetails: VersionGroupDetails.fromJson(json['version_group_details']),
    );
  }
}

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

class StatModel {
  final int baseStat;
  final int effort;
  final String name;
  final String url;

  StatModel({
    required this.baseStat,
    required this.effort,
    required this.name,
    required this.url,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      name: json['stat']['name'],
      url: json['stat']['url'],
    );
  }
}

class TypeModel {
  final int slot;
  final String name;
  final String url;

  TypeModel({
    required this.slot,
    required this.name,
    required this.url,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      slot: json['slot'],
      name: json['type']['name'],
      url: json['type']['url'],
    );
  }
}

class VersionDetails {
  final int rarity;
  final VersionModel version;

  VersionDetails({
    required this.rarity,
    required this.version,
  });

  factory VersionDetails.fromJson(Map<String, dynamic> json) {
    return VersionDetails(
      rarity: json['rarity'],
      version: VersionModel.fromJson(json['version']),
    );
  }
}

class VersionGroupDetails {
  final int levelLearnedAt;
  final MoveLearnMethod moveLearnMethod;
  final VersionGroup versionGroup;

  VersionGroupDetails({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetails(
      levelLearnedAt: json['level_learned_at'],
      moveLearnMethod: MoveLearnMethod.fromJson(json['move_learn_method']),
      versionGroup: VersionGroup.fromJson(json['version_group']),
    );
  }
}

class VersionGroup {
  final String name;
  final String url;

  VersionGroup({
    required this.name,
    required this.url,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) {
    return VersionGroup(
      name: json['name'],
      url: json['url'],
    );
  }
}

class VersionModel {
  final String name;
  final String url;

  VersionModel({
    required this.name,
    required this.url,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
