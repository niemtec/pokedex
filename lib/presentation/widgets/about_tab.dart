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
        _tabRow(Icons.group, pokemon.types.first.color, "Species", pokemon.species),
        _tabRow(
            Icons.straighten, pokemon.types.first.color, "Height", _formatHeight(pokemon.height)),
        _tabRow(Icons.scale_rounded, pokemon.types.first.color, "Weight",
            _formatWeight(pokemon.weight)),
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

Widget _tabRow(IconData icon, Color accentColour, String rowTitle, String rowContent) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Container(
      decoration: BoxDecoration(
        color: accentColour.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 16.0),
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
            _title(rowTitle),
            const Spacer(),
            _description(rowContent)
          ],
        ),
      ),
    ),
  );
}

Widget _title(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _description(String text) {
  return Text(text);
}

String _formatHeight(int heightInDecimeters) {
  double cm = heightInDecimeters * 10;
  double inches = cm / 2.54;

  // Metric: cm or m
  String metric = cm < 100 ? '${cm.toInt()}cm' : '${(cm / 100).toStringAsFixed(2)}m';

  // Imperial: inches or feet + inches
  String imperial;
  if (inches < 12) {
    imperial = '${inches.toStringAsFixed(1)}inches';
  } else {
    int feet = inches ~/ 12;
    double remainingInches = inches % 12;
    imperial = '${feet}ft ${remainingInches.toStringAsFixed(1)}in';
  }

  return '$metric ($imperial)';
}

String _formatWeight(int weightInHectograms) {
  const double hgPerPound = 4.53592;
  const double poundsPerStone = 14;

  double totalPounds = weightInHectograms / hgPerPound;
  int stones = totalPounds ~/ poundsPerStone;
  double pounds = totalPounds % poundsPerStone;

  return stones == 0
      ? "${weightInHectograms / 10}kg (${pounds.toStringAsFixed(2)} lbs)"
      : "${weightInHectograms / 10}kg (${stones}st ${pounds.toStringAsFixed(2)} lbs)";
}
