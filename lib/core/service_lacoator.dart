import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/dio_consumer.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/data/repo_impl/governorates_repo_impl.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/home/data/repo/home_repo.dart';
import 'package:awraq/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/notification/data/repo/notification_repo.dart';
import 'package:awraq/features/notification/data/repo_impl/notification_repo_impl.dart';
import 'package:awraq/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/data/repo/profile_repository_impl.dart';
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
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
 // Notification Repository
  // =========================

  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  // =========================
  // Notification Cubit
  // =========================

  getIt.registerFactory<NotificationCubit>(
    () => NotificationCubit(
      repo: getIt<NotificationRepo>(),
    ),
  );


}
