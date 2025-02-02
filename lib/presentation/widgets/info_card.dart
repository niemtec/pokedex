import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_cubit.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_states.dart';
import 'package:pokedex/presentation/widgets/about_tab.dart';
import 'package:pokedex/presentation/widgets/dot_indicator.dart';
import 'package:pokedex/presentation/widgets/loading_indicator.dart';
import 'package:pokedex/presentation/utils/extensions.dart';

class InfoCard extends StatefulWidget {
  final String pokemonName;
  final String imageUrl;
  final String heroTag;
  final Color accentColour;

  const InfoCard({
    required this.pokemonName,
    required this.imageUrl,
    required this.heroTag,
    required this.accentColour,
    super.key,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonDetailsPageCubit>().getPokemonDetails(pokemonName: widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          DefaultTabController(
            length: 4,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  _tabs(widget.accentColour),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 34.0, right: 34.0, top: 16.0, bottom: 24.0),
                      child: BlocBuilder<PokemonDetailsPageCubit, PokemonDetailsPageState>(
                          builder: (context, state) {
                        if (state is PokemonDetailsPageError) {
                          return const SizedBox.shrink(); //TODO: Add error view
                        }
                        if (state is PokemonDetailsPageLoading) {
                          return const Center(
                            child: LoadingIndicator(),
                          );
                        }
                        if (state is PokemonDetailsPageLoaded) {
                          return const TabBarView(
                            children: [
                              AboutTab(),
                              Icon(Icons.directions_transit),
                              Icon(Icons.directions_bike),
                              Icon(Icons.directions_bike),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          _pokemonImage(widget.imageUrl, widget.heroTag),
        ],
      ),
    );
  }
}

Widget _tabs(Color colour) {
  return Column(
    children: [
      TabBar(
        labelColor: darkenColour(colour, 0.2),
        dividerColor: Colors.transparent,
        indicator: DotIndicator(color: darkenColour(colour, 0.2)),
        tabs: [
          _tab(
            "About",
          ),
          _tab(
            "Base Stats",
          ),
          _tab(
            "Evolution",
          ),
          _tab(
            "Moves",
          ),
        ],
      ),
    ],
  );
}

Tab _tab(String title) {
  return Tab(
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _pokemonImage(String imageUrl, String heroTag) {
  return Positioned(
    top: -260,
    child: Hero(
      tag: heroTag,
      child: Image.network(
        imageUrl,
        height: 300,
      ),
    ),
  );
}
