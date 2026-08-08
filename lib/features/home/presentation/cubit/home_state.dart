import 'package:awraq/features/home/data/model/category_model.dart';
import 'package:awraq/features/home/data/model/service_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CategoryModel> categories;
  final List<ServiceModel> services;
  final int? selectedCategoryId;

  HomeSuccess({
    required this.categories,
    required this.services,
    required this.selectedCategoryId,
  });
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);
}