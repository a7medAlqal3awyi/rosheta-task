import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:task/core/api/api_consumer.dart';
import 'package:task/core/api/dio_consumer.dart';
import 'package:task/core/api/end_point.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo_impl.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo_impl.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_cubit.dart';
import 'package:task/feature/get_rosheta/data/repo/get_repo.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo_impl.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_cubit.dart';

import '../../feature/delete_rosheta/prestentation/model_view/delete_rosheta_cubit.dart';
import '../../feature/get_rosheta/data/repo/repo_imp.dart';
import '../../feature/get_rosheta/presentation/model_view/cubit/get_rosheta_cubit.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // Register Dio instance with PrettyDioLogger and custom interceptors
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiEndPoint.baseUrl, // Replace with your API base URL
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    return dio;
  });

  // Register DioConsumer
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl<Dio>()));

  // Register Repositories
  sl.registerLazySingleton<GetRepo>(() => GetRepoImlp(sl<ApiConsumer>()));
  sl.registerLazySingleton<UploadRoshtaRepo>(() => UploadRepoImpl(sl<ApiConsumer>()));
  sl.registerLazySingleton<EditRepo>(() => EditRoshetaRepoImpl(sl<ApiConsumer>()));
  sl.registerLazySingleton<DeleteRoshetaRepo>(() => DeleteRepoIml(sl<ApiConsumer>()));

  // Register Cubits
  sl.registerFactory<GetRoshetaCubit>(() => GetRoshetaCubit(sl<GetRepo>()));
  sl.registerFactory<UploadRoshetaCubit>(() => UploadRoshetaCubit(sl<UploadRoshtaRepo>()));
  sl.registerFactory<EditRoshetaCubit>(() => EditRoshetaCubit(sl<EditRepo>()));
  sl.registerFactory<DeleteRoshetaCubit>(() => DeleteRoshetaCubit(sl<DeleteRoshetaRepo>()));
}
