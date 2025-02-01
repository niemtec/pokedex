import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_cubit.dart';
import 'package:pokedex/presentation/bloc/details_page/pokemon_details_page_states.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/widgets/loading_indicator.dart';

class PokemonProfilePage extends StatefulWidget {
  final String pokemonName;
  final Color backgroundColor;
  final String imageUrl;
  final String heroTag;

  const PokemonProfilePage({
    super.key,
    required this.pokemonName,
    required this.backgroundColor,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  State<PokemonProfilePage> createState() => _PokemonProfilePageState();
}

class _PokemonProfilePageState extends State<PokemonProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
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
      backgroundColor: widget.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _topDetailArea(widget.pokemonName, context),
          _pokeballBackground(_controller),
          _bottomInfoCard(widget.imageUrl, widget.heroTag)
        ],
      ),
    );
  }
}

Widget _topDetailArea(String pokemonName, BuildContext context) {
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
                "#number",
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Test",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
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

Widget _bottomInfoCard(String imageUrl, String heroTag) {
  return Expanded(
    child: Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: Colors.white,
          ),
          child: const LoadingIndicator(),
        ),
        Positioned(
          top: -260,
          child: Hero(
            tag: heroTag,
            child: Image.network(
              imageUrl,
              height: 300,
            ),
          ),
        ),
      ],
    ),
  );
}
