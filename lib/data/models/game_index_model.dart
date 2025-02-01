import 'package:pokedex/data/models/version.dart';

class GameIndexModel {
  final int gameIndex;
  final Version version;

  GameIndexModel({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndexModel.fromJson(Map<String, dynamic> json) {
    return GameIndexModel(
      gameIndex: json['game_index'],
      version: Version.fromJson(json['version']),
    );
  }
}
