import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonModelMapper {
  static Pokemon toDomain(PokemonModel model) {
    return Pokemon(
      id: model.id,
      name: model.name,
      order: model.order,
      isDefault: model.isDefault,
      locationAreaEncounters: model.locationAreaEncounters,
      abilities: _mapAbilities(model.abilities),
      baseExperience: model.baseExperience,
      cries: _mapCries(model.cries),
      forms: _mapForms(model.forms),
      gameIndices: _mapGameIndices(model.gameIndices),
      height: model.height,
      heldItems: _mapHeldItems(model.heldItems),
      moves: _mapMoves(model.moves),
      pastAbilities: _mapPastAbilities(model.pastAbilities),
      pastTypes: _mapPastTypes(model.pastTypes),
      species: Species(
        name: model.species.name,
        url: model.species.url,
      ),
      sprite: _mapSprite(model.sprite),
      stats: _mapStats(model.stats),
      types: _mapTypes(model.types),
      weight: model.weight,
    );
  }
}

List<Ability> _mapAbilities(List<AbilityModel> abilities) {
  return abilities.map((ability) {
    return Ability(
      name: ability.name,
      url: ability.url,
      isHidden: ability.isHidden,
      slot: ability.slot,
    );
  }).toList();
}

List<Cry> _mapCries(List<CryModel> cries) {
  return cries.map((cry) {
    return Cry(
      latest: cry.latest,
      legacy: cry.legacy,
    );
  }).toList();
}

List<Form> _mapForms(List<FormModel> forms) {
  return forms.map((form) {
    return Form(
      name: form.name,
      url: form.url,
    );
  }).toList();
}

List<GameIndex> _mapGameIndices(List<GameIndexModel> gameIndices) {
  return gameIndices.map((gameIndex) {
    return GameIndex(
        gameIndex: gameIndex.gameIndex,
        version: Version(
          name: gameIndex.version.name,
          url: gameIndex.version.url,
        ));
  }).toList();
}

List<HeldItem> _mapHeldItems(List<HeldItemModel> heldItems) {
  return heldItems.map((heldItem) {
    return HeldItem(
      name: heldItem.name,
      url: heldItem.url,
      versionDetails: heldItem.versionDetails,
    );
  }).toList();
}

List<Move> _mapMoves(List<MoveModel> moves) {
  return moves.map((move) {
    return Move(
      name: move.name,
      url: move.url,
    );
  }).toList();
}

List<Ability> _mapPastAbilities(List<AbilityModel> pastAbilities) {
  return pastAbilities.map((pastAbility) {
    return Ability(
      name: pastAbility.name,
      url: pastAbility.url,
      isHidden: pastAbility.isHidden,
      slot: pastAbility.slot,
    );
  }).toList();
}

List<PokemonType> _mapPastTypes(List<TypeModel> pastTypes) {
  return pastTypes.map((pastType) {
    return PokemonType(
      name: pastType.name,
      url: pastType.url,
    );
  }).toList();
}

Sprite _mapSprite(SpriteModel sprite) {
  return Sprite(
      backDefault: sprite.backDefault,
      backFemale: sprite.backFemale,
      backShiny: sprite.backShiny,
      backShinyFemale: sprite.backShinyFemale,
      frontDefault: sprite.frontDefault,
      frontFemale: sprite.frontFemale,
      frontShiny: sprite.frontShiny,
      frontShinyFemale: sprite.frontShinyFemale,
      other: Other(
        dreamWorld: _mapDreamWorld(sprite.other.dreamWorld),
        officialArtwork: _mapOfficialArtwork(sprite.other.officialArtwork),
      ));
}

DreamWorld _mapDreamWorld(DreamWorldModel dreamWorld) {
  return DreamWorld(
    frontDefault: dreamWorld.frontDefault,
    frontFemale: dreamWorld.frontFemale,
  );
}

OfficialArtwork _mapOfficialArtwork(OfficialArtworkModel officialArtwork) {
  return OfficialArtwork(
    frontDefault: officialArtwork.frontDefault,
  );
}

List<Stat> _mapStats(List<StatModel> stats) {
  return stats.map((stat) {
    return Stat(
      name: stat.name,
      url: stat.url,
      baseStat: stat.baseStat,
      effort: stat.effort,
    );
  }).toList();
}

List<PokemonType> _mapTypes(List<TypeModel> types) {
  return types.map((type) {
    return PokemonType(
      name: type.name,
      url: type.url,
    );
  }).toList();
}
