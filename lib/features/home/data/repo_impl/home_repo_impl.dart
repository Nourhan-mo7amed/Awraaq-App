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

    return (response["data"] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();
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

    return (response["data"] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await api.get(
      path: EndPoints.category,
      data: null,
    );

    return (response["data"] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
