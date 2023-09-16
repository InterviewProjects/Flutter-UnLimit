import 'dart:async';

import 'package:dio/dio.dart';
import 'package:domain_package/config/unlimit_app_config.dart';
import 'package:domain_package/entities/api/unlimit_app_model.dart';
import 'package:domain_package/entities/joke/unlimit_joke_response.dart';
import 'package:domain_package/enums/app_env.dart';

class NetworkController {
  final Dio apiClient;
  final UnLimitAppConfiguration appConfig;

  NetworkController({required this.apiClient, required this.appConfig, }) {
    apiClient
      ..options.connectTimeout = const Duration(milliseconds: Duration.millisecondsPerMinute)
      ..options.receiveTimeout = const Duration(milliseconds: Duration.millisecondsPerMinute);
  }

  Future<UnLimitAppResponse<T>> get<T>(String path, {UnLimitAppURLsType urlType = UnLimitAppURLsType.unLimitJokes, Map<String, dynamic> queryParams = const {}}) async =>
      processRequest(
        requestOptions: RequestOptions(
          path: '${appConfig.unLimitAppURLTypeMap[urlType]}/$path',
          method: 'GET',
          queryParameters: queryParams,
        ),
      );

  Future<UnLimitAppResponse<T>> processRequest<T>({required RequestOptions requestOptions }) async {
    UnLimitAppResponse<T> returnValue = UnLimitAppResponse();
    try {
      final res = await apiClient.fetch(requestOptions);

      if (res.statusCode!.toString().contains('20')) {
        returnValue.data = _processSuccessResponse<T>(res.data);
      } else {
        returnValue.error = UnLimitAppError(error: res.data);
      }
    } on DioException catch(dioError) {
      returnValue.error = UnLimitAppError(error: Exception(dioError.toString()));
    } catch(e) {
      returnValue.error = UnLimitAppError(error: e);
    }

    return returnValue;
  }

  T? _processSuccessResponse<T>(dynamic resBody) {
    T? returnValue;
    try {
      final decodedBody = resBody;
      switch(T) {
        case Map:
          returnValue = decodedBody;
          break;

        case List:
          returnValue = decodedBody;
          break;

        case UnLimitJokeResponse:
          returnValue = UnLimitJokeResponse.fromJson(decodedBody) as T;
          break;
      }
    } catch(e) {}

    return returnValue;
  }
}