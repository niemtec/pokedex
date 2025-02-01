import 'package:pokedex/data/models/version.dart';

class VersionDetails {
  final int rarity;
  final Version version;

  VersionDetails({
    required this.rarity,
    required this.version,
  });

  factory VersionDetails.fromJson(Map<String, dynamic> json) {
    return VersionDetails(
      rarity: json['rarity'],
      version: Version.fromJson(json['version']),
    );
  }
}
