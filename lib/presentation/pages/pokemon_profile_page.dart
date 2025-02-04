import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/widgets/info_card.dart';

class PokemonProfilePage extends StatefulWidget {
  final Pokemon pokemon;
  final String heroTag;

  const PokemonProfilePage({
    super.key,
    required this.pokemon,
    required this.heroTag,
  });

  @override
  State<PokemonProfilePage> createState() => _PokemonProfilePageState();
}

class _PokemonProfilePageState extends State<PokemonProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: widget.pokemon.accentColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _topDetailArea(
              pokemonName: widget.pokemon.name,
              id: widget.pokemon.id,
              types: widget.pokemon.types,
              accentColour: widget.pokemon.accentColour,
              context: context),
          _pokeballBackground(_animationController),
          // _bottomInfoCard(widget.pokemonProfile.imageUrl, widget.heroTag)
          InfoCard(
            pokemon: widget.pokemon,
            heroTag: widget.heroTag,
          ),
        ],
      ),
    );
  }
}

Widget _topDetailArea(
    {required String pokemonName,
    required int id,
    required List<PokemonType> types,
    required Color accentColour,
    required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          types.first.iconForPokemonType,
                          color: accentColour,
                          size: 32 * 0.6,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    pokemonName.toTitleCase(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "#$id",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            for (var type in types) _typeTag(type.name),
          ],
        ),
      ],
    ),
  );
}

Widget _pokeballBackground(AnimationController controller) {
  return RotationTransition(
    turns: controller,
    child: Image.asset(
      'assets/pokeball-white.png',
      width: 250,
      height: 250,
      color: Colors.white.withOpacity(0.2),
    ),
  );
}

Widget _typeTag(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      text.toTitleCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}
