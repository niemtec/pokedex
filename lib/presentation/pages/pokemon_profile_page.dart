import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon_summary.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_cubit.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_states.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/utils/utilities.dart';
import 'package:pokedex/presentation/widgets/info_card.dart';
import 'package:pokedex/presentation/widgets/loading_indicator.dart';

class PokemonProfilePage extends StatefulWidget {
  final PokemonSummary pokemonProfile;
  final String heroTag;

  const PokemonProfilePage({
    super.key,
    required this.pokemonProfile,
    required this.heroTag,
  });

  @override
  State<PokemonProfilePage> createState() => _PokemonProfilePageState();
}

class _PokemonProfilePageState extends State<PokemonProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Color accentColour;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    )..repeat();
    accentColour = getPokemonTypeColour(widget.pokemonProfile.types[0]);
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
      backgroundColor: accentColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _topDetailArea(widget.pokemonProfile.name, widget.pokemonProfile.id,
              widget.pokemonProfile.types, context),
          _pokeballBackground(_animationController),
          // _bottomInfoCard(widget.pokemonProfile.imageUrl, widget.heroTag)
          InfoCard(
            pokemonName: widget.pokemonProfile.name,
            imageUrl: widget.pokemonProfile.imageUrl,
            heroTag: widget.heroTag,
            accentColour: accentColour,
          ),
        ],
      ),
    );
  }
}

Widget _topDetailArea(
    String pokemonName, String id, List<PokemonType> types, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemonName.toTitleCase(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
      color: Colors.white.withOpacity(0.4),
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
