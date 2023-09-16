import 'package:data_package/data_export.dart';
import 'package:domain_package/enums/app_env.dart';
import 'package:domain_package/usecase/unlimit_joke_use_case.dart';
import 'package:get_it/get_it.dart';

class DomainLayer {
  static Future<void> addDomainLayerDependencies(UnLimitEnvironment env) async {
    await DataLayer.addDataLayerDependencies(env);

    appInjector.registerLazySingleton<UnLimitJokeUseCase>(() => UnLimitJokeUseCase(appInjector()));
  }
}
final appInjector = GetIt.instance;