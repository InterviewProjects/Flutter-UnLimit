import 'package:domain_package/src/domain_layer.dart';
import 'package:domain_package/usecase/unlimit_joke_use_case.dart';

mixin UseCaseExtension {
  UnLimitJokeUseCase get jokeListUseCase {
    return appInjector<UnLimitJokeUseCase>();
  }
}