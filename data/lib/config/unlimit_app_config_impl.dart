// ignore_for_file: constant_identifier_names

import 'package:domain_package/enums/app_env.dart';
import 'package:domain_package/config/unlimit_app_config.dart';

class UnLimitAppConfigurationImpl implements UnLimitAppConfiguration {
  @override
  late UnLimitEnvironment environment;

  UnLimitAppConfigurationImpl({required UnLimitEnvironment appEnv}) {
    environment = appEnv;
  }

  @override
  Map<UnLimitAppURLsType, String> get unLimitAppURLTypeMap => environment.unLimitAppURLTypeMap;
}

extension EnvironmentExtension on UnLimitEnvironment {
  Map<UnLimitAppURLsType, String> get unLimitAppURLTypeMap {
    switch (this) {
      case UnLimitEnvironment.Production:
        return {
          UnLimitAppURLsType.unLimitJokes: 'https://geek-jokes.sameerkumar.website',
        };
    }
  }
}