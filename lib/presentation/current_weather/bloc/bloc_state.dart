import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
part 'bloc_state.freezed.dart';

abstract class WeattherState {}

class WeatherInitState extends WeattherState {}

@freezed
class CurrentState extends WeattherState with _$CurrentState {
  factory CurrentState({CurrentWeatherModel? currentWeatherModel}) =
      _CurrentState;
}
