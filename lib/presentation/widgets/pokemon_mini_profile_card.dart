// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/pages/pokemon_profile_page.dart';
import 'package:pokedex/presentation/utils/extensions.dart';
import 'package:pokedex/presentation/utils/slide_up_page_route.dart';
import 'package:pokedex/presentation/widgets/logo_widget.dart';

class PokemonMiniProfileCard extends StatelessWidget {
  static const double _aspectRatio = 3 / 2;
  static const double _cardWidth = 200.0;
  static const double _borderRadius = 16.0;
  static const double _padding = 16.0;

  // Size multipliers
  static const double _nameMultiplier = 0.12;
  static const double _verticalPaddingMultiplier = 0.02;
  static const double _horizontalPaddingMultiplier = 0.04;

  const PokemonMiniProfileCard({
    required this.pokemonProfile,
    super.key,
  });

  final Pokemon pokemonProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToPokemonProfile(context),
      child: AspectRatio(
        aspectRatio: _aspectRatio,
        child: _buildCard(),
      ),
    );
  }

  void _navigateToPokemonProfile(BuildContext context) {
    Navigator.push(
      context,
      SlideUpPageRoute(
        page: PokemonProfilePage(
          pokemon: pokemonProfile,
          heroTag: 'pokemonImage-${pokemonProfile.id}',
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: _cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: pokemonProfile.types.first.color,
        boxShadow: [
          BoxShadow(
            color: pokemonProfile.types.first.color.withValues(alpha: 0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: pokemonProfile.types.first.color.withValues(alpha: 0.1),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            _buildPokeballBackground(constraints),
            _buildCardContent(constraints),
          ],
        ),
      ),
    );
  }

  Widget _buildPokeballBackground(BoxConstraints constraints) {
    return Positioned(
      right: -constraints.maxWidth * 0.15,
      bottom: -constraints.maxHeight * 0.3,
      child: Transform.rotate(
        angle: 0.45,
        child: LogoWidget(
          size: constraints.maxHeight,
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
    );
  }

  Widget _buildCardContent(BoxConstraints constraints) {
    final double nameSize = constraints.maxHeight * _nameMultiplier;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(_padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTopRow(nameSize),
              _buildBottomRow(constraints),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: SizedBox(
            height: constraints.maxHeight * 0.65,
            child: _buildPokemonImage(),
          ),
        ),
      ],
    );
  }

  Widget _buildTopRow(double nameSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            pokemonProfile.name.toTitleCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: nameSize,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '#${pokemonProfile.id.toString().padLeft(3, '0')}',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontWeight: FontWeight.bold,
            fontSize: nameSize,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRow(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(child: _buildTypesTags(constraints)),
          // _buildPokemonImage(),
        ],
      ),
    );
  }

  Widget _buildTypesTags(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: pokemonProfile.types
          .map(
            (type) => _buildTypeTag(type, constraints),
          )
          .toList(),
    );
  }

  Widget _buildTypeTag(PokemonType type, BoxConstraints constraints) {
    final double vPadding = constraints.maxHeight * _verticalPaddingMultiplier;
    final double hPadding = constraints.maxWidth * _horizontalPaddingMultiplier;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPadding),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: vPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Text(
          type.name.toTitleCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Hero(
      tag: 'pokemonImage-${pokemonProfile.id}',
      child: Image.network(
        pokemonProfile.sprite,
        fit: BoxFit.contain,
      ),
    );
  }
}
