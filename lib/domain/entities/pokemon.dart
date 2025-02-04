import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final List<PokemonType> types;
  final List<String> abilities;
  final Color accentColour;
  final String species;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.types,
    required this.abilities,
    required this.accentColour,
    required this.species,
  });
}
