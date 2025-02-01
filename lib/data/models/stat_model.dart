class StatModel {
  final int baseStat;
  final int effort;
  final String name;
  final String url;

  StatModel({
    required this.baseStat,
    required this.effort,
    required this.name,
    required this.url,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      name: json['stat']['name'],
      url: json['stat']['url'],
    );
  }
}
