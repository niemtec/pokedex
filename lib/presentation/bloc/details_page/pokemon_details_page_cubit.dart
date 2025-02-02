import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/usecases/get_pokemon_details_usecase.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_states.dart';

class PokemonDetailsPageCubit extends Cubit<PokemonDetailsPageState> {
  final GetPokemonDetailsUsecase _getPokemonDetailsUsecase;

  PokemonDetailsPageCubit({
    required GetPokemonDetailsUsecase getPokemonDetailsUsecase,
  })  : _getPokemonDetailsUsecase = getPokemonDetailsUsecase,
        super(PokemonDetailsPageInitial());

  void getPokemonDetails({required String pokemonName}) {
    emit(PokemonDetailsPageLoading());
    _getPokemonDetailsUsecase(pokemonName: pokemonName).then(
      (pokemonDetails) {
        emit(PokemonDetailsPageLoaded(pokemonDetails));
      },
    ).catchError(
      (error) {
        emit(PokemonDetailsPageError(error.toString()));
      },
    );
  }
}
