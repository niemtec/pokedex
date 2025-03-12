import 'package:get_it/get_it.dart';
import 'package:pokedex/core/network/graphql_client.dart';
import 'package:pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';

final getIt = GetIt.instance;

void initialiseDependencies() {
  // Register services
  getIt.registerLazySingleton<GraphQLService>(() => GraphQLService.init());

  // Register datasources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSource(graphQLService: getIt()));

  // Register repositories
  getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(getIt()));

  // Register usecases
  getIt.registerLazySingleton<GetPokemonsUsecase>(() => GetPokemonsUsecase(getIt()));

  // Register cubits
  getIt.registerFactory<HomepageCubit>(() => HomepageCubit(getPokemonListUsecase: getIt()));
}
