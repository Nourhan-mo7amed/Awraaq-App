class ServiceModel {
  final int id;
  final String title;
  final String description;
  final String icon;
  final int categoryId;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.categoryId,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      icon: json["icon"],
      categoryId: json["category_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "icon": icon,
      "category_id": categoryId,
    };
  }
}