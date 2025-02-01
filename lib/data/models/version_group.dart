class VersionGroup {
  final String name;
  final String url;

  VersionGroup({
    required this.name,
    required this.url,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) {
    return VersionGroup(
      name: json['name'],
      url: json['url'],
    );
  }
}
