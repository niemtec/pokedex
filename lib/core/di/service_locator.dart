import 'package:get_it/get_it.dart';
import 'package:pokedex/core/network/graphql_client.dart';
import 'package:pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';
import 'package:pokedex/core/cache/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register CacheService
  getIt.registerSingleton<CacheService>(
    CacheService(prefs: sharedPreferences),
  );

  // Register services
  getIt.registerLazySingleton<GraphQLService>(() => GraphQLService.init());

  // Register datasources
  getIt.registerSingleton<PokemonRemoteDataSource>(
    PokemonRemoteDataSource(
      graphQLService: getIt<GraphQLService>(),
      cacheService: getIt<CacheService>(),
    ),
  );

  // Register repositories
  getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(getIt()));

  // Register usecases
  getIt.registerLazySingleton<GetPokemonsUsecase>(() => GetPokemonsUsecase(getIt()));

  // Register cubits
  getIt.registerFactory<HomepageCubit>(() => HomepageCubit(getPokemonListUsecase: getIt()));
}
