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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Fetch initial set of pokemon
    context.read<HomepageCubit>().getPokemon(isInitialLoad: true);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Fetch more pokemon when bottom is reached
        context.read<HomepageCubit>().getPokemon();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _pokedexLogo(),
              ),
              Expanded(
                child: BlocBuilder<HomepageCubit, HomepageState>(
                  buildWhen: (previous, current) =>
                      current is HomepageLoaded, // Only rebuild on data change
                  builder: (context, state) {
                    if (state is HomepageError) {
                      //TODO: Show error message
                    }

                    if (state is HomepageLoading) {
                      return const LoadingIndicator(
                        loaderSize: LoaderSize.large,
                      );
                    }

                    if (state is HomepageLoaded) {
                      return LayoutBuilder(builder: (context, constraints) {
                        // Calculate crossAxisCount dynamically based on the screen width
                        int crossAxisCount = (constraints.maxWidth / 200)
                            .floor(); // 200 is the max width of a single card

                        // If crossAxisCount is less than 1, set it to 1 (at least one column)
                        crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount, // Number of columns in the grid
                              crossAxisSpacing: 10, // Space between columns
                              mainAxisSpacing: 10, // Space between rows`
                              childAspectRatio: 3 / 2),
                          controller: _scrollController,
                          itemCount: state.pokemonList.length + 1,
                          itemBuilder: (context, index) {
                            if (index == state.pokemonList.length) {
                              return state.hasMoreItems
                                  ? const LoadingIndicator(
                                      loadingText: "Loading more Pokemon",
                                      loaderSize: LoaderSize.small,
                                    )
                                  : const SizedBox.shrink();
                            }
                            final pokemon = state.pokemonList[index];
                            return PokemonProfileCard(
                              pokemonProfile: pokemon,
                            );
                          },
                        );
                      });
                    } else if (state is HomepageError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const LoadingIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _homepageCubit.close();
    _scrollController.dispose();

    super.dispose();
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
