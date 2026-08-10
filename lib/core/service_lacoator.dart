import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/dio_consumer.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/data/repo_impl/governorates_repo_impl.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/home/data/repo/home_repo.dart';
import 'package:awraq/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/location_details/data/repo/location_details_repo.dart';
import 'package:awraq/features/location_details/data/repo_impl/location_details_repo_impl.dart';
import 'package:awraq/features/location_details/presentation/cubit/location_details_cubit.dart';
import 'package:awraq/features/procedure_details/data/repo/procedure_details_repo.dart';
import 'package:awraq/features/procedure_details/data/repo_impl/procedure_details_repo_impl.dart';
import 'package:awraq/features/procedure_details/presentation/cubit/procedure_details_cubit.dart';
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
  // Allow re-registration on hot restart
  getIt.allowReassignment = true;

  /// Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

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

  /// Profile Repository
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  /// Governorates
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

  /// Procedure Details Repository
  getIt.registerLazySingleton<ProcedureDetailsRepo>(
    () => ProcedureDetailsRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  /// Procedure Details Cubit
  getIt.registerFactory<ProcedureDetailsCubit>(
    () => ProcedureDetailsCubit(
      getIt<ProcedureDetailsRepo>(),
    ),
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


