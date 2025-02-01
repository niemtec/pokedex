class AbilityModel {
  final String name;
  final String url;
  final bool isHidden;
  final int slot;

  AbilityModel({
    required this.name,
    required this.url,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json['ability']['name'],
      url: json['ability']['url'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}
