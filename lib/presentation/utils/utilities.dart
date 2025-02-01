import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

Color getPokemonTypeColour(PokemonType type) {
  switch (type) {
    case PokemonType.normal:
      return const Color(0xFFA8A77A);
    case PokemonType.fire:
      return const Color(0xFFFB6C6C);
    case PokemonType.water:
      return const Color(0xFF91CAFD);
    case PokemonType.grass:
      return const Color(0xFF48D0B0);
    case PokemonType.electric:
      return const Color(0xFFFED86F);
    case PokemonType.ice:
      return const Color(0xFF96D9D6);
    case PokemonType.fighting:
      return const Color(0xFFC22E28);
    case PokemonType.poison:
      return const Color(0xFFA33EA1);
    case PokemonType.ground:
      return const Color(0xFFE2BF65);
    case PokemonType.flying:
      return const Color(0xFFA98FF3);
    case PokemonType.psychic:
      return const Color(0xFFF95587);
    case PokemonType.bug:
      return const Color(0xFFA6B91A);
    case PokemonType.rock:
      return const Color(0xFFB6A136);
    case PokemonType.ghost:
      return const Color(0xFF735797);
    case PokemonType.dragon:
      return const Color(0xFF6F35FC);
    case PokemonType.dark:
      return const Color(0xFF705746);
    case PokemonType.steel:
      return const Color(0xFFB7B7CE);
    case PokemonType.fairy:
      return const Color(0xFFD685AD);
    case PokemonType.shadow:
      return const Color(0xFF5A5A5A);
    case PokemonType.unknown:
      return const Color(0xFF68A090);
  }
}
