import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

abstract class PokemonDetailsPageState extends Equatable {
  const PokemonDetailsPageState();

  @override
  List<Object> get props => [];
}

class PokemonDetailsPageInitial extends PokemonDetailsPageState {}

class PokemonDetailsPageLoading extends PokemonDetailsPageState {}

class PokemonDetailsPageLoaded extends PokemonDetailsPageState {
  final PokemonDetails pokemonDetails;

  const PokemonDetailsPageLoaded(this.pokemonDetails);

  @override
  List<Object> get props => [pokemonDetails];
}

class PokemonDetailsPageError extends PokemonDetailsPageState {
  final String message;

  const PokemonDetailsPageError(this.message);

  @override
  List<Object> get props => [message];
}
