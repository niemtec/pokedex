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
        _tabRow("Species", pokemon.species),
        _tabRow("Height", _formatHeight(pokemon.height)),
        _tabRow("Weight", _formatWeight(pokemon.weight)),
        _tabRow("Abilities", _deliminateList(pokemon.abilities)),
      ],
    );
  }
}

Widget _tabRow(String rowTitle, String rowContent) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_title(rowTitle), _description(rowContent)],
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

String _deliminateList(List<String> list) {
  String text = "";

  if (list.isEmpty) {
    text = "";
  }

  if (list.length == 1) {
    text = list.first;
  } else {
    for (var i = 0; i < list.length; i++) {
      text += list[i].toTitleCase();
      if (i != list.length - 1) {
        text += ", ";
      }
    }
  }

  return text;
}
