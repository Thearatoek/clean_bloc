import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/client/get_product_api_client.dart';
import 'package:todo_app_clean_bloc_test/shared/constants/url_constants.dart';

@LazySingleton()
class GetCurrentWeatherService {
  GetCurrentWeatherService(this._getProductApiClient);

  final GetCurrentWeatherClient _getProductApiClient;

  Future<dynamic> getCurrentWeather({required String zipCode}) async {
    return _getProductApiClient.get(
      path: UrlConstants.currentWeather
          .replaceAll("{zipCode}", "?q=$zipCode&key=${UrlConstants.apiKey}"),
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }
}
