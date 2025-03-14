// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/pages/pokemon_profile_page.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/utils/slide_up_page_route.dart';

class PokemonMiniProfileCard extends StatelessWidget {
  const PokemonMiniProfileCard({
    required this.pokemonProfile,
    super.key,
  });

  final Pokemon pokemonProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SlideUpPageRoute(
            page: PokemonProfilePage(
              pokemon: pokemonProfile,
              heroTag: 'pokemonImage-${pokemonProfile.id}',
            ),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: pokemonProfile.types.first.color,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  Positioned(
                    right: -30,
                    bottom: -30,
                    child: _pokeballBackground(constraints.maxHeight * 0.9),
                  ),
                  Positioned(
                    child: _cardContent(pokemonProfile, constraints),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _cardContent(Pokemon pokemonProfile, BoxConstraints constraints) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemonProfile.name.toTitleCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            _idTag(
              pokemonProfile.id.toString(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _propertyTags(pokemonProfile.types),
            Hero(
              tag: 'pokemonImage-${pokemonProfile.id}',
              child: Image.network(
                pokemonProfile.sprite,
                height: constraints.maxHeight * 0.6,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _idTag(String id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        '#$id',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    ],
  );
}

Widget _pokeballBackground(double width) {
  return Transform.rotate(
    angle: 0.45,
    child: Image.asset(
      'assets/pokeball-white.png',
      width: width,
      color: Colors.white.withValues(alpha: 0.2), // Optional: make it semi-transparent
    ),
  );
}

Widget _propertyTags(List<PokemonType> types) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: types
        .map(
          (type) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                type.name.toTitleCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}
