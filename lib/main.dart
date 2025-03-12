import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/di/service_locator.dart';
import 'package:pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemons_usecase.dart';

import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';
import 'presentation/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  initialiseDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<http.Client>(create: (_) => http.Client()),
        Provider<PokemonRemoteDataSource>(
          create: (_) => getIt<PokemonRemoteDataSource>(),
        ),
        Provider<PokemonRepository>(
          create: (_) => getIt<PokemonRepositoryImpl>(),
        ),
        Provider<GetPokemonsUsecase>(
          create: (_) => getIt<GetPokemonsUsecase>(),
        ),
        BlocProvider<HomepageCubit>(
          create: (_) => getIt<HomepageCubit>(),
        ),
      ],
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
