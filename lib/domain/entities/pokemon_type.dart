import 'package:flutter/material.dart';

enum PokemonType {
  normal(
    color: Color(0xFFA8A77A),
    icon: Icons.person,
  ),
  fire(
    color: Color(0xFFFB6C6C),
    icon: Icons.fitness_center,
  ),
  water(
    color: Color(0xFF91CAFD),
    icon: Icons.airplanemode_active,
  ),
  grass(
    color: Color(0xFF48D0B0),
    icon: Icons.sick,
  ),
  electric(
    color: Color(0xFFFED86F),
    icon: Icons.landscape,
  ),
  ice(
    color: Color(0xFF96D9D6),
    icon: Icons.terrain,
  ),
  fighting(
    color: Color(0xFFC22E28),
    icon: Icons.bug_report,
  ),
  poison(
    color: Color(0xFFA33EA1),
    icon: Icons.visibility_off,
  ),
  ground(
    color: Color(0xFFE2BF65),
    icon: Icons.build,
  ),
  flying(
    color: Color(0xFFA98FF3),
    icon: Icons.local_fire_department,
  ),
  psychic(
    color: Color(0xFFF95587),
    icon: Icons.water_drop,
  ),
  bug(
    color: Color(0xFFA6B91A),
    icon: Icons.grass,
  ),
  rock(
    color: Color.fromARGB(255, 164, 162, 152),
    icon: Icons.flash_on,
  ),
  ghost(
    color: Color(0xFF735797),
    icon: Icons.psychology,
  ),
  dragon(
    color: Color(0xFF6F35FC),
    icon: Icons.ac_unit,
  ),
  dark(
    color: Color(0xFF705746),
    icon: Icons.local_fire_department,
  ),
  steel(
    color: Color(0xFFB7B7CE),
    icon: Icons.nightlight_round,
  ),
  fairy(
    color: Color(0xFFD685AD),
    icon: Icons.star,
  ),
  shadow(
    color: Color(0xFF5A5A5A),
    icon: Icons.visibility,
  ),
  unknown(
    color: Color(0xFF68A090),
    icon: Icons.help_outline,
  );

  const PokemonType({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;
}
