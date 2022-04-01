class NewsCategoryModel {
  final String id;
  final String name;
  final String description, category, country;

  NewsCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.country,
  });

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) {
    return NewsCategoryModel(
        id: json['id'],
        name: json['name'],
        description: json["description"],
        category: json["category"],
        country: json["country"]);
  }
}
