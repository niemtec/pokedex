class MoveLearnMethod {
  final String name;
  final String url;

  MoveLearnMethod({
    required this.name,
    required this.url,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return MoveLearnMethod(
      name: json['name'],
      url: json['url'],
    );
  }
}
