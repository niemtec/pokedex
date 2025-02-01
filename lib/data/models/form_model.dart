class FormModel {
  final String name;
  final String url;

  FormModel({
    required this.name,
    required this.url,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
