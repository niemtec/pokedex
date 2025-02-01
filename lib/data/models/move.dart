import 'package:pokedex/data/models/version_group_details.dart';

class Move {
  final String name;
  final String url;
  final VersionGroupDetails versionGroupDetails;

  Move({
    required this.name,
    required this.url,
    required this.versionGroupDetails,
  });
}
