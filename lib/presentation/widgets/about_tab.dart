import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/utils/extensions.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;
  const AboutTab({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // _tabRow(Icons.group, pokemon.types.first.color, "Species", pokemon.species),
        _tabRow(Icons.straighten, pokemon.types.first.color, "Height",
            pokemon.height.toString()),
        _tabRow(Icons.scale_rounded, pokemon.types.first.color, "Weight",
            pokemon.weight.toString()),
        _tabRow(
          Icons.star,
          pokemon.types.first.color,
          "Abilities",
          pokemon.abilities.map((value) => value.toTitleCase()).join(", "),
        ),
      ],
    );
  }
}

Widget _tabRow(
    IconData icon, Color accentColour, String rowTitle, String rowContent) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Container(
      decoration: BoxDecoration(
        color: accentColour.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          left: 4.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: accentColour,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 32 * 0.6,
                  ),
                ),
              ),
            ),
            Text(
              rowTitle,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(rowContent),
          ],
        ),
      ),
    ),
  );
}
