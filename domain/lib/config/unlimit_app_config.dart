import 'package:domain_package/enums/app_env.dart';


abstract class UnLimitAppConfiguration {
  late UnLimitEnvironment environment;
  Map<UnLimitAppURLsType, String> get unLimitAppURLTypeMap;
}
