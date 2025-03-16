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
  // Core services
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<CacheService>(
    CacheService(prefs: sharedPreferences),
  );

  getIt.registerLazySingleton<GraphQLService>(
    () => GraphQLService.init(),
  );

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(
      cacheService: getIt<CacheService>(),
      graphQLService: getIt<GraphQLService>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      getIt<PokemonRemoteDataSource>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<GetPokemonsUsecase>(
    () => GetPokemonsUsecase(
      getIt<PokemonRepository>(),
    ),
  );

  // Cubits
  getIt.registerFactory<HomepageCubit>(
    () => HomepageCubit(
      getPokemonListUsecase: getIt<GetPokemonsUsecase>(),
    ),
  );
}
