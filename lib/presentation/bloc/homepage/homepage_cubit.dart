import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_states.dart';
import 'package:pokedex/domain/usecases/get_pokemons_usecase.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetPokemonsUsecase _getPokemonListUsecase;

  HomepageCubit({
    required GetPokemonsUsecase getPokemonListUsecase,
  })  : _getPokemonListUsecase = getPokemonListUsecase,
        super(HomepageInitial());

  int _page = 1;
  bool _isLoading = false;
  final List<Pokemon> _pokemonList = [];
  bool _hasMoreItems = true;

  Future<void> getPokemon({bool isFirstLoad = false}) async {
    if (_isLoading || !_hasMoreItems) return;
    _isLoading = true;
    emit(HomepageLoading());
    try {
      final result =
          await _getPokemonListUsecase(offset: isFirstLoad ? 0 : _page * 10);
      if (result.isEmpty) {
        _hasMoreItems = false;
      } else {
        _pokemonList.addAll(result);
        _page++;
      }
      emit(HomepageLoaded(
        pokemonList: _pokemonList,
        hasMoreItems: _hasMoreItems,
        // isLoadingNextItems: false,
      ));
    } catch (e) {
      _isLoading = false;
      emit(
        HomepageError(
          e.toString(),
        ),
      );
    }
  }
}
