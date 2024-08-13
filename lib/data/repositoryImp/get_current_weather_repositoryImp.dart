import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/data/repository/service/get_current_weather_service.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
import 'package:todo_app_clean_bloc_test/domain/repository/get_current_weather_repository.dart';

@Injectable(as: GetCurrentWeatherRepository)
class GetCurrentWeatherRepositoryimp implements GetCurrentWeatherRepository {
  GetCurrentWeatherRepositoryimp(this._getCurrentWeatherService);

  final GetCurrentWeatherService _getCurrentWeatherService;
  @override
  Future<CurrentWeatherModel?> getCurrentWeatherRepository(
      {required String zipCountryCode}) async {
    final response = await _getCurrentWeatherService.getCurrentWeather(
        zipCode: zipCountryCode);
    debugPrint("response $response");
    return CurrentWeatherModel.fromJson(response as Map<String, dynamic>);
  }
}
