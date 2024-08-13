import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';

abstract class GetCurrentWeatherRepository {
  Future<CurrentWeatherModel?> getCurrentWeatherRepository(
      {required String zipCountryCode});
}
