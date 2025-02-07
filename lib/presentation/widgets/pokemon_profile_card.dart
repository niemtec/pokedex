// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/pages/pokemon_profile_page.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/utils/slide_up_page_route.dart';

class PokemonProfileCard extends StatelessWidget {
  const PokemonProfileCard({
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
          // padding: const EdgeInsets.all(16),
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: pokemonProfile.types.first.color,
          ),
          child: Stack(
            children: [
              Positioned(
                right: -60,
                bottom: -60,
                child: _pokeballBackground(),
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Hero(
                  tag: 'pokemonImage-${pokemonProfile.id}',
                  child: Image.network(
                    pokemonProfile.sprite,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: _idTag(
                  pokemonProfile.id.toString(),
                ),
              ),
              Positioned(
                top: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              pokemonProfile.name.toTitleCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          _propertyTags(pokemonProfile.types),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _idTag(String id) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, right: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '#$id',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _pokeballBackground() {
  return Transform.rotate(
    angle: 0.45,
    child: Image.asset(
      'assets/pokeball-white.png',
      width: 150,
      height: 150,
      color: Colors.white.withOpacity(0.2), // Optional: make it semi-transparent
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
