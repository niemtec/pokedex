import 'package:flutter/material.dart';

enum PokemonType {
  normal(color: Color(0xFFA8A77A)),
  fire(color: Color(0xFFFB6C6C)),
  water(color: Color(0xFF91CAFD)),
  grass(color: Color(0xFF48D0B0)),
  electric(color: Color(0xFFFED86F)),
  ice(color: Color(0xFF96D9D6)),
  fighting(color: Color(0xFFC22E28)),
  poison(color: Color(0xFFA33EA1)),
  ground(color: Color(0xFFE2BF65)),
  flying(color: Color(0xFFA98FF3)),
  psychic(color: Color(0xFFF95587)),
  bug(color: Color(0xFFA6B91A)),
  rock(color: Color(0xFFB6A136)),
  ghost(color: Color(0xFF735797)),
  dragon(color: Color(0xFF6F35FC)),
  dark(color: Color(0xFF705746)),
  steel(color: Color(0xFFB7B7CE)),
  fairy(color: Color(0xFFD685AD)),
  shadow(color: Color(0xFF5A5A5A)),
  unknown(color: Color(0xFF68A090));

  const PokemonType({
    required this.color,
  });

  final Color color;
}
