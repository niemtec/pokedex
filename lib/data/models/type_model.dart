class TypeModel {
  final int slot;
  final String name;
  final String url;

  TypeModel({
    required this.slot,
    required this.name,
    required this.url,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      slot: json['slot'],
      name: json['type']['name'],
      url: json['type']['url'],
    );
  }
}
