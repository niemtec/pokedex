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
        _tabRow("Species", [pokemon.species]),
        _tabRow("Abilities", pokemon.abilities),
      ],
    );
  }
}

Widget _tabRow(String rowTitle, List<String> rowContent) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [_title(rowTitle), _description(rowContent)],
  );
}

Widget _title(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _description(List<String> textList) {
  String text = "";

  if (textList.isEmpty) {
    text = "";
  }

  if (textList.length == 1) {
    text = textList.first;
  } else {
    for (var i = 0; i < textList.length; i++) {
      text += textList[i].toTitleCase();
      if (i != textList.length - 1) {
        text += ", ";
      }
    }
  }

  return Text(text);
}
