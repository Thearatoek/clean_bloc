import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/get_current_weather_usecase.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_event.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_state.dart';
import 'package:todo_app_clean_bloc_test/shared/constants/url_constants.dart';

@Injectable()
class BlocBloc extends Bloc<CurrentWeatherEvent, CurrentState> {
  BlocBloc(this._getCurrentWeatherUsecase) : super(CurrentState()) {
    on<CurrentWeatherEvent>(_onGetCurrentWeather);
  }
  final GetCurrentWeatherUsecase _getCurrentWeatherUsecase;

  Future _onGetCurrentWeather(
      CurrentWeatherEvent event, Emitter<CurrentState> emit) async {
    final output = await _getCurrentWeatherUsecase.execute(
      GetCurrentWeatherUsecaseInput(zipCountryCode: event.zipCountryCode),
    );

    emit(state.copyWith(currentWeatherModel: output.currentWeatherModel));
    print(UrlConstants.currentWeather
        .replaceAll("{zipCode}", "?q=120012&key=${UrlConstants.apiKey}"));
    return output;
  }
}
