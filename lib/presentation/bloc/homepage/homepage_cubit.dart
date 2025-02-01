import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemon_by_name_usecase.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_states.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list_usecase.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetPokemonListUsecase _getPokemonListUsecase;
  final GetPokemonByNameUsecase _getPokemonByNameUsecase;

  HomepageCubit({
    required GetPokemonListUsecase getPokemonListUsecase,
    required GetPokemonByNameUsecase getPokemonByNameUsecase,
  })  : _getPokemonListUsecase = getPokemonListUsecase,
        _getPokemonByNameUsecase = getPokemonByNameUsecase,
        super(HomepageInitial());

  void getPokemonList({int offset = 0}) {
    emit(HomepageLoading());
    _getPokemonListUsecase().then(
      (pokemonList) {
        emit(HomepageLoaded(pokemonList));
      },
    ).catchError(
      (error) {
        emit(HomepageError(error.toString()));
      },
    );
  }
}
