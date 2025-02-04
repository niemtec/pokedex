import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

extension StringExtension on String {
  String toTitleCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Color darkenColour(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

Color brightenColour(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslBright = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslBright.toColor();
}

extension PokemonTypeIcon on PokemonType {
  IconData get iconForPokemonType {
    switch (this) {
      case PokemonType.normal:
        return Icons.person;
      case PokemonType.fighting:
        return Icons.fitness_center;
      case PokemonType.flying:
        return Icons.airplanemode_active;
      case PokemonType.poison:
        return Icons.sick;
      case PokemonType.ground:
        return Icons.landscape;
      case PokemonType.rock:
        return Icons.terrain;
      case PokemonType.bug:
        return Icons.bug_report;
      case PokemonType.ghost:
        return Icons.visibility_off;
      case PokemonType.steel:
        return Icons.build;
      case PokemonType.fire:
        return Icons.local_fire_department;
      case PokemonType.water:
        return Icons.water_drop;
      case PokemonType.grass:
        return Icons.grass;
      case PokemonType.electric:
        return Icons.flash_on;
      case PokemonType.psychic:
        return Icons.psychology;
      case PokemonType.ice:
        return Icons.ac_unit;
      case PokemonType.dragon:
        return Icons.local_fire_department;
      case PokemonType.dark:
        return Icons.nightlight_round;
      case PokemonType.fairy:
        return Icons.star;
      case PokemonType.shadow:
        return Icons.visibility;
      case PokemonType.unknown:
        return Icons.help_outline;
      default:
        return Icons.help_outline; // Default icon in case type is not recognised
    }
  }
}
