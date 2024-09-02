import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_event.freezed.dart';

abstract class WeatherEvent {}

@freezed
class CurrentWeatherEvent extends WeatherEvent with _$CurrentWeatherEvent {
  factory CurrentWeatherEvent({required String zipCountryCode}) =
      _CurrentWeatherEvent;
}
