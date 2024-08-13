import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/data/local/real_time_data_local.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/base/base_interceptor.dart';
import 'package:todo_app_clean_bloc_test/shared/server_constants.dart';

import 'base/connectivity_interception.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout:
            options?.connectTimeout ?? ServerTimeoutConstants.connectTimeout,
        receiveTimeout:
            options?.receiveTimeout ?? ServerTimeoutConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ServerTimeoutConstants.sendTimeout,
        baseUrl: options?.baseUrl ?? '',
      ),
    );

    final sortedInterceptors = [
      ...ApiClientDefaultSetting.requiredInterceptors(dio),
      ...interceptors,
    ].sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });
    dio.interceptors.addAll(sortedInterceptors);

    return dio;
  }
}

@LazySingleton()
class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add custom headers
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }
}

@Injectable()
class AccessTokenInterceptor extends Interceptor {
  final LocalDataStore _localDataStore;

  AccessTokenInterceptor(this._localDataStore);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${_localDataStore.accessToken}';
    super.onRequest(options, handler);
  }
}

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  static const defaultErrorResponseMapperType =
      ErrorResponseMapperType.jsonObject;
  static const defaultSuccessResponseMapperType =
      SuccessResponseMapperType.dataJsonObject;

  static List<Interceptor> requiredInterceptors(Dio dio) => [
        ConnectivityInterceptor(),
      ];
}

enum ErrorResponseMapperType {
  jsonObject,
  jsonArray,
  paymentJsonArray,
}

enum SuccessResponseMapperType {
  dataJsonObject,
  dataJsonArray,
  jsonObject,
  jsonArray,
  recordsJsonArray,
  resultsJsonArray,
  dataContentArray,
  dataContent,
  plain,
}
