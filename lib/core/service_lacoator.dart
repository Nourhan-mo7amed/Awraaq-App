import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/dio_consumer.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/data/repo_impl/governorates_repo_impl.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/data/repo/profile_repository_impl.dart';
import 'package:dio/dio.dart';
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

  
}
