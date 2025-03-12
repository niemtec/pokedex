import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecase(this.repository);

  Future<List<Pokemon>> call({int offset = 0}) async {
    return repository.getPokemons(offset: offset, limit: 20);
  }
}
