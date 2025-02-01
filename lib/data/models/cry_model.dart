class CryModel {
  final String latest;
  final String legacy;

  CryModel({
    required this.latest,
    required this.legacy,
  });

  factory CryModel.fromJson(Map<String, dynamic> json) {
    return CryModel(
      latest: json['latest'],
      legacy: json['legacy'],
    );
  }
}
