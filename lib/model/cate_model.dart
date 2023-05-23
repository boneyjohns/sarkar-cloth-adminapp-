
class CateModel {
  final String name;

  CateModel({required this.name});

  Map<String, dynamic> toJson() => {
        'name': name,
      };
  static CateModel fromJson(Map<String, dynamic> json) =>
      CateModel(name: json['name']);
}
