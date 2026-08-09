class ServiceModel {
  final int id;
  final String name;
  final String description;
  final String estimatedTime;
  final String fees;
  final String requiredDocuments;
  final String status;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.estimatedTime,
    required this.fees,
    required this.requiredDocuments,
    required this.status,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      estimatedTime: json['estimated_time']?.toString() ?? '',
      fees: json['fees']?.toString() ?? '',
      requiredDocuments:
          json['required_documents']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
    );
  }
}
// class ServiceModel {
//   final int id;
//   final String title;
//   final String description;
//   final String icon;
//   final int categoryId;

//   ServiceModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.categoryId,
//   });

//   factory ServiceModel.fromJson(Map<String, dynamic> json) {
//     return ServiceModel(
//       id: json["id"],
//       title: json["title"],
//       description: json["description"],
//       icon: json["icon"],
//       categoryId: json["category_id"],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "title": title,
//       "description": description,
//       "icon": icon,
//       "category_id": categoryId,
//     };
//   }
// }