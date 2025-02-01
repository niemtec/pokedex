import 'package:pokedex/data/models/version_details.dart';

class HeldItem {
  final String name;
  final String url;
  final VersionDetails versionDetails;

  HeldItem({
    required this.name,
    required this.url,
    required this.versionDetails,
  });
}
