import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_states.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list_usecase.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetPokemonListUsecase _getPokemonListUsecase;

  HomepageCubit({
    required GetPokemonListUsecase getPokemonListUsecase,
  })  : _getPokemonListUsecase = getPokemonListUsecase,
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
