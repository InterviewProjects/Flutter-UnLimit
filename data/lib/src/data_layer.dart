import 'package:data_package/config/unlimit_app_config_impl.dart';
import 'package:data_package/local/app_storage.dart';
import 'package:data_package/local/app_storage_impl.dart';
import 'package:data_package/remote/network_controller.dart';
import 'package:data_package/repositories/unlimit_joke_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain_package/config/unlimit_app_config.dart';
import 'package:domain_package/enums/app_env.dart';
import 'package:domain_package/repositories/unlimit_joke_repository.dart';
import 'package:get_it/get_it.dart';

class DataLayer {
  static Future<void> addDataLayerDependencies(UnLimitEnvironment env) async {
    appInjector.registerLazySingleton<UnLimitAppConfiguration>(() => UnLimitAppConfigurationImpl(appEnv: env));
    final appStorage = AppStorageImpl();
    await appStorage.init();
    appInjector.registerLazySingleton<AppStorage>(() => appStorage);
    appInjector.registerLazySingleton<Dio>(() => Dio());
    appInjector.registerLazySingleton<NetworkController>(() => NetworkController(apiClient: appInjector(), appConfig: appInjector()));
    appInjector.registerLazySingleton<UnLimitJokeRepository>(() => UnLimitJokeRepositoryImpl(appInjector(), appInjector()));
  }
}
final appInjector = GetIt.instance;