import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/widgets/info_card.dart';
import 'package:pokedex/presentation/widgets/logo_widget.dart';

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
      backgroundColor: widget.pokemon.types.first.color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _topDetailArea(
              pokemonName: widget.pokemon.name,
              id: widget.pokemon.id,
              types: widget.pokemon.types,
              accentColour: widget.pokemon.types.first.color,
              context: context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navigationButton(
                onPressed: () => {},
                icon: FontAwesomeIcons.chevronLeft,
                isEnabled: widget.pokemon.id > 1,
              ),
              _pokeballBackground(_animationController),
              _navigationButton(
                onPressed: () => {},
                icon: FontAwesomeIcons.chevronRight,
              ),
            ],
          ),
          InfoCard(
            pokemon: widget.pokemon,
            heroTag: widget.heroTag,
          ),
        ],
      ),
    );
  }
}

Widget _navigationButton(
    {required IconData icon, required Function() onPressed, bool isEnabled = true}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: IconButton(
      onPressed: isEnabled ? onPressed : null,
      icon: Icon(
        icon,
        color: isEnabled ? Colors.white : Colors.grey[700],
      ),
    ),
  );
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          types.first.icon,
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
                "#${id.toString().padLeft(3, '0')}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white.withValues(alpha: 0.6), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            for (var type in types) _typeTag(type.name, context),
          ],
        ),
      ],
    ),
  );
}

Widget _pokeballBackground(AnimationController controller) {
  return RotationTransition(
    turns: controller,
    child: LogoWidget(
      size: 250,
      color: Colors.white.withValues(alpha: 0.2),
    ),
  );
}

Widget _typeTag(String text, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    margin: const EdgeInsets.only(right: 8.0),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(65.0),
    ),
    child: Text(
      text.toTitleCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
      ),
    ),
  );
}
