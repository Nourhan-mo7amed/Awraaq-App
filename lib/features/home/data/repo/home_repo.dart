import 'package:awraq/features/home/data/model/category_model.dart';
import 'package:awraq/features/home/data/model/service_model.dart';

abstract class HomeRepo {
  Future<List<ServiceModel>> getAllServices();

  Future<List<ServiceModel>> getServicesByCategory(int categoryId);

  Future<List<CategoryModel>> getCategories();
}