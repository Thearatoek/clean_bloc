import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/get_current_weather_usecase.dart';
import 'package:todo_app_clean_bloc_test/helper/utils/appUtil.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_event.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_state.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather_screen.dart';

@Injectable()
class WeatherBloc extends Bloc<WeatherEvent, WeattherState> {
  WeatherBloc(this._getCurrentWeatherUsecase) : super(WeatherInitState()) {
    on<CurrentWeatherEvent>(_onGetCurrentWeather);
  }
  final GetCurrentWeatherUsecase _getCurrentWeatherUsecase;
  final _appLink = AppLinks();
  Future<void> _onGetCurrentWeather(
      CurrentWeatherEvent event, Emitter<WeattherState> emit) async {
    try {
      emit(
        WeatherInitState(),
      );

      final output = await _getCurrentWeatherUsecase.execute(
        GetCurrentWeatherUsecaseInput(zipCountryCode: event.zipCountryCode),
      );

      emit(
        CurrentState(currentWeatherModel: output.currentWeatherModel),
      );
      AppUtil.hideLoading();
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
