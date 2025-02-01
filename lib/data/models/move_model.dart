import 'package:pokedex/data/models/version_group_details.dart';

class MoveModel {
  final String name;
  final String url;
  final VersionGroupDetails versionGroupDetails;

  MoveModel({
    required this.name,
    required this.url,
    required this.versionGroupDetails,
  });

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      name: json['name'],
      url: json['url'],
      versionGroupDetails: VersionGroupDetails.fromJson(json['version_group_details']),
    );
  }
}
