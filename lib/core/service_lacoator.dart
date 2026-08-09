import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/dio_consumer.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/data/repo_impl/governorates_repo_impl.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/home/data/repo/home_repo.dart';
import 'package:awraq/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/data/repo/profile_repository_impl.dart';
import 'package:awraq/features/location_details/data/repo/location_details_repo.dart';
import 'package:awraq/features/location_details/data/repo_impl/location_details_repo_impl.dart';
import 'package:awraq/features/location_details/presentation/cubit/location_details_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  /// Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  /// Api Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: getIt<Dio>(),
      storage: getIt<FlutterSecureStorage>(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  getIt.registerLazySingleton<GovernoratesRepo>(
    () => GovernoratesRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  getIt.registerFactory(
    () => GovernoratesCubit(
      repo: getIt<GovernoratesRepo>(),
    ),
  );

  /// Home Repository
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  /// Home Cubit
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt<HomeRepo>(),
    ),
  );

  /// Location Details Repository
  getIt.registerLazySingleton<LocationDetailsRepo>(
    () => LocationDetailsRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  /// Location Details Cubit
  getIt.registerFactory<LocationDetailsCubit>(
    () => LocationDetailsCubit(
      getIt<LocationDetailsRepo>(),
    ),
  );

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
