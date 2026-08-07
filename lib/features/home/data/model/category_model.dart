import 'package:lucide_icons_flutter/lucide_icons.dart';

class CategoryModel {
  final int id;
  final String name;
 // LucideIcons icon;

  CategoryModel({
    required this.id,
    required this.name,
  // this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
     // icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
     // "icon": icon,
    };
  }
}