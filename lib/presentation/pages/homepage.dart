import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_states.dart';
import 'package:pokedex/presentation/widgets/loading_indicator.dart';
import 'package:pokedex/presentation/widgets/pokemon_profile_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late HomepageCubit _homepageCubit;

  @override
  void initState() {
    super.initState();
    _homepageCubit = context.read<HomepageCubit>()..getPokemonList();
  }

  @override
  void dispose() {
    _homepageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageError) {
              //TODO: Show error message
            }

            if (state is HomepageLoading) {
              return const Center(child: LoadingIndicator());
            }

            if (state is HomepageLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _pokedexLogo(),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          const maxWidth = 200.0;
                          final itemWidth =
                              (constraints.maxWidth / 2) - 12; // Adjust for padding and spacing
                          final width = itemWidth > maxWidth ? maxWidth : itemWidth;

                          return Wrap(
                            spacing: 8.0, // Horizontal spacing between children
                            runSpacing: 8.0, // Vertical spacing between lines

                            children: state.pokemonList.map((pokemon) {
                              return SizedBox(
                                width: width,
                                child: PokemonProfileCard(
                                  pokemonProfile: pokemon,
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is HomepageError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Press the button to load Pokémon'));
            }
          },
        ),
      ),
    );
  }
}

Widget _pokedexLogo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          -1, 0, 0, 0, 255, // Red
          0, -1, 0, 0, 255, // Green
          0, 0, -1, 0, 255, // Blue
          0, 0, 0, 1, 0, // Alpha
        ]),
        child: Image.asset(
          'assets/pokeball-white.png',
          width: 60,
          height: 60,
        ),
      ),
      const Text(
        "Pokedex",
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
        ),
      ),
    ],
  );
}
