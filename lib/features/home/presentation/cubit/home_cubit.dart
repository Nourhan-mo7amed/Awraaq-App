import 'package:awraq/features/home/data/model/category_model.dart';
import 'package:awraq/features/home/data/model/service_model.dart';
import 'package:awraq/features/home/data/repo/home_repo.dart';
import 'package:awraq/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());

  final HomeRepo repo;

  List<CategoryModel> categories = [];
  List<ServiceModel> services = [];

  int? selectedCategoryId;

  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      categories = await repo.getCategories();

      services = await repo.getAllServices();

      emit(
        HomeSuccess(
          categories: categories,
          services: services,
          selectedCategoryId: null,
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> selectCategory(int? categoryId) async {
    emit(HomeLoading());

    try {
      selectedCategoryId = categoryId;

      if (categoryId == null) {
        services = await repo.getAllServices();
      } else {
        services = await repo.getServicesByCategory(categoryId);
      }

      emit(
        HomeSuccess(
          categories: categories,
          services: services,
          selectedCategoryId: selectedCategoryId,
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}