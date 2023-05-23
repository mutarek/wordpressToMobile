import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';
import 'package:wordpress_mobile/data/repo/home_repo.dart';
import 'package:wordpress_mobile/module/splash/splash_provider.dart';
import 'package:wordpress_mobile/utils/appConstant.dart';

import 'data/remote/dio/dio_client.dart';
import 'data/remote/dio/loggingInterceptor.dart';
import 'module/splash/splash_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => SplashRepo());
  sl.registerLazySingleton(() => HomeRepository(dioClient: sl()));
  // sl.registerLazySingleton(
  //     () => AuthRepo1(sharedPreferences: sl(), dioClient: sl()));
  // sl.registerLazySingleton(() => HotelRepo(apiClient: sl(), authRepo: sl()));
  // sl.registerLazySingleton(() => HotelRepo1(dioClient: sl(), authRepo: sl()));
  // sl.registerLazySingleton(() => RoomRepo(apiClient: sl(), authRepo: sl()));
  // sl.registerLazySingleton(() => RoomRepo1(dioClient: sl(), authRepo: sl()));
  // sl.registerLazySingleton(() => BookingRepo(apiClient: sl(), authRepo: sl()));
  // sl.registerLazySingleton(() => DashBoardRepo(dioClient: sl(), authRepo: sl()));

  // Provider
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepository: sl()));
  // sl.registerFactory(() => AuthProvider(authRepo: sl()));
  // sl.registerFactory(() => HotelProvider(hotelRepo: sl()));
  // sl.registerFactory(() => RoomProvider(roomRepo: sl()));
  // sl.registerFactory(() => BookingProvider(bookingRepo: sl()));
  // sl.registerFactory(() => DashBoardProvider(dashBoardRepo: sl()));
  // sl.registerFactory(() => OtherProvider());

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
