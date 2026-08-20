import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';
import 'package:awraq/features/home/data/model/category_model.dart';
import 'package:awraq/features/home/data/model/service_model.dart';
import 'package:awraq/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({
    required this.api,
  });

  @override
  Future<List<ServiceModel>> getAllServices() async {
    final response = await api.get(
      path: EndPoints.category,
      data: null,
    );

    if (response == null || response is! Map || response["data"] is! List) {
      return [];
    }

    final categoriesData = response["data"] as List;
    final List<ServiceModel> allServices = [];

    for (var cat in categoriesData) {
      if (cat is Map<String, dynamic> && cat["Procedures"] is List) {
        for (var proc in cat["Procedures"]) {
          if (proc is Map<String, dynamic>) {
            allServices.add(ServiceModel.fromJson(proc));
          }
        }
      }
    }

    return allServices;
  }

  @override
  Future<List<ServiceModel>> getServicesByCategory(int categoryId) async {
    final response = await api.get(
      path: EndPoints.category,
      queryParameters: {
        "category_id": categoryId,
      },
      data: null,
    );

    if (response == null || response is! Map || response["data"] is! List) {
      return [];
    }

    final categoriesData = response["data"] as List;
    final List<ServiceModel> services = [];

    for (var cat in categoriesData) {
      if (cat is Map<String, dynamic> &&
          (cat['id'] == categoryId || categoryId == 0) &&
          cat["Procedures"] is List) {
        for (var proc in cat["Procedures"]) {
          if (proc is Map<String, dynamic>) {
            services.add(ServiceModel.fromJson(proc));
          }
        }
      }
    }

    return services;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await api.get(
      path: EndPoints.category,
      data: null,
    );

    if (response == null || response is! Map || response["data"] is! List) {
      return [];
    }

    return (response["data"] as List)
        .whereType<Map<String, dynamic>>()
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
