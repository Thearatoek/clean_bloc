import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/base/rest_api_client.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/get_product_api_client.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
import 'package:todo_app_clean_bloc_test/shared/constants/url_constants.dart';

@LazySingleton()
class GetCurrentWeatherService {
  GetCurrentWeatherService(this._getProductApiClient);

  final GetCurrentWeather _getProductApiClient;

  Future<CurrentWeatherModel?> getCurrentWeather(
      {required String zipCode}) async {
    return _getProductApiClient.request(
      method: RestMethod.get,
      path: UrlConstants.currentWeather,
      decoder: (json) =>
          CurrentWeatherModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
