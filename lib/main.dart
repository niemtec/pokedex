import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/datasources/pokeapi_datasource.dart';
import 'package:pokedex/data/repositories/pokemon_data_repository.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemons_usecase.dart';

import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';
import 'presentation/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<http.Client>(create: (_) => http.Client()),
        Provider<PokeapiDatasource>(
          create: (context) => PokeapiDatasourceImpl(),
        ),
        Provider<PokemonRepository>(
          create: (context) => PokemonDataRepositoryImpl(context.read<PokeapiDatasource>()),
        ),
        Provider<GetPokemonsUsecase>(
          create: (context) => GetPokemonsUsecase(context.read<PokemonRepository>()),
        ),
        BlocProvider<HomepageCubit>(
          create: (context) => HomepageCubit(
            getPokemonListUsecase: context.read<GetPokemonsUsecase>(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
