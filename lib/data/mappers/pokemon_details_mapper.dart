import 'package:pokedex/data/models/pokemon_details_model.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

class PokemonDetailsMapper {
  static PokemonDetails toDomain(PokemonDetailsModel pokemonDetailsModel) {
    return PokemonDetails(
      species: pokemonDetailsModel.species?.name ?? "",
      height: pokemonDetailsModel.height.toString(),
      weight: pokemonDetailsModel.weight.toString(),
      abilities: _mapAbilities(pokemonDetailsModel.abilities),
    );
  }
}

List<String> _mapAbilities(List<Abilities>? abilities) {
  if (abilities == null) {
    return [];
  }

  List<String> mappedAbilities = [];

  for (var ability in abilities) {
    if (ability.ability != null) {
      mappedAbilities.add(ability.ability!.name ?? "");
    }
  }
  return mappedAbilities;
}
