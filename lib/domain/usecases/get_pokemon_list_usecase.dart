import 'package:pokedex/domain/entities/pokemon_summary.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonListUsecase {
  final PokemonRepository repository;

  GetPokemonListUsecase(this.repository);

  Future<List<PokemonSummary>> call({int offset = 0}) async {
    return repository.getPokemonList(offset);
  }
}
