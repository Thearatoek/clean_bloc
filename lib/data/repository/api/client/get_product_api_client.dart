import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/base/rest_api_client.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/dio_builder.dart';
import 'package:todo_app_clean_bloc_test/shared/constants/url_constants.dart';

@LazySingleton()
class GetCurrentWeatherClient extends RestApiClient {
  GetCurrentWeatherClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: UrlConstants.domainApiBaseUrl,
            ),
            interceptors: [],
          ),
        );
}
