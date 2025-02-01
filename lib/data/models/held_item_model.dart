import 'package:pokedex/data/models/version_details.dart';

class HeldItemModel {
  final String name;
  final String url;
  final VersionDetails versionDetails;

  HeldItemModel({
    required this.name,
    required this.url,
    required this.versionDetails,
  });

  factory HeldItemModel.fromJson(Map<String, dynamic> json) {
    return HeldItemModel(
      name: json['name'],
      url: json['url'],
      versionDetails: VersionDetails.fromJson(json['version_details']),
    );
  }
}
