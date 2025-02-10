import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepageLoaded extends HomepageState {
  final List<Pokemon> pokemonList;
  final bool hasMoreItems;

  const HomepageLoaded({
    required this.pokemonList,
    required this.hasMoreItems,
  });

  @override
  List<Object> get props => [
        pokemonList,
        hasMoreItems,
      ];
}

class HomepageError extends HomepageState {
  final String message;

  const HomepageError(this.message);

  @override
  List<Object> get props => [message];
}
