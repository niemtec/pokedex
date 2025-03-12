import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/widgets/about_tab.dart';
import 'package:pokedex/presentation/widgets/dot_indicator.dart';
import 'package:pokedex/presentation/utils/extensions.dart';

class InfoCard extends StatelessWidget {
  final Pokemon pokemon;
  final String heroTag;

  const InfoCard({
    required this.pokemon,
    required this.heroTag,
    super.key,
  });

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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: darkenColour(pokemon.types.first.color, 0.05),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, -4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  _tabs(pokemon.types.first.color),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 34.0, right: 34.0, top: 16.0, bottom: 24.0),
                      child: TabBarView(
                        children: [
                          AboutTab(pokemon: pokemon),
                          const Icon(Icons.directions_transit),
                          const Icon(Icons.directions_bike),
                          const Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _pokemonImage(pokemon.sprite, heroTag),
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
    top: -210,
    child: Hero(
      tag: heroTag,
      child: Image.network(
        imageUrl,
        height: 250,
      ),
    ),
  );
}
