import 'service_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final String? description;
  final List<ServiceModel> procedures;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    required this.procedures,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      procedures: (json['Procedures'] as List? ?? [])
          .map(
            (e) => ServiceModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}
// // 
// import 'package:awraq/features/home/data/model/service_model.dart';

// class CategoryModel {
//   final int id;
//   final String name;
//   final String? description;
//   final List<ServiceModel> procedures;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     this.description,
//     required this.procedures,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: json['id'] as int,
//       name: json['name'] as String,
//       description: json['description'] as String?,
//       procedures: (json['Procedures'] as List? ?? [])
//           .map(
//             (e) => ServiceModel.fromJson(
//               e as Map<String, dynamic>,
//             ),
//           )
//           .toList(),
//     );
//   }
// }