import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PokemonType {
  normal(
    color: Color(0xFFA8A77A),
    icon: FontAwesomeIcons.circle,
  ),
  fire(
    color: Color(0xFFFB6C6C),
    icon: FontAwesomeIcons.fire,
  ),
  water(
    color: Color(0xFF91CAFD),
    icon: FontAwesomeIcons.droplet,
  ),
  grass(
    color: Color(0xFF48D0B0),
    icon: FontAwesomeIcons.seedling,
  ),
  electric(
    color: Color(0xFFFED86F),
    icon: FontAwesomeIcons.boltLightning,
  ),
  ice(
    color: Color(0xFF96D9D6),
    icon: FontAwesomeIcons.snowflake,
  ),
  fighting(
    color: Color(0xFFC22E28),
    icon: FontAwesomeIcons.handBackFist,
  ),
  poison(
    color: Color(0xFFA33EA1),
    icon: FontAwesomeIcons.skullCrossbones,
  ),
  ground(
    color: Color(0xFFE2BF65),
    icon: FontAwesomeIcons.circle,
  ),
  flying(
    color: Color(0xFFA98FF3),
    icon: FontAwesomeIcons.fly,
  ),
  psychic(
    color: Color(0xFFF95587),
    icon: FontAwesomeIcons.brain,
  ),
  bug(
    color: Color(0xFFA6B91A),
    icon: FontAwesomeIcons.bug,
  ),
  rock(
    color: Color.fromARGB(255, 164, 162, 152),
    icon: FontAwesomeIcons.gem,
  ),
  ghost(
    color: Color(0xFF735797),
    icon: FontAwesomeIcons.ghost,
  ),
  dragon(
    color: Color(0xFF6F35FC),
    icon: FontAwesomeIcons.dragon,
  ),
  dark(
    color: Color(0xFF705746),
    icon: FontAwesomeIcons.moon,
  ),
  steel(
    color: Color(0xFFB7B7CE),
    icon: FontAwesomeIcons.box,
  ),
  fairy(
    color: Color(0xFFD685AD),
    icon: FontAwesomeIcons.handSparkles,
  ),
  shadow(
    color: Color(0xFF5A5A5A),
    icon: FontAwesomeIcons.ghost,
  ),
  unknown(
    color: Color(0xFF68A090),
    icon: FontAwesomeIcons.question,
  );

  const PokemonType({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;
}
