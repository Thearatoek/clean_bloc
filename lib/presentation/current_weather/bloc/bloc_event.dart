import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_event.freezed.dart';

@freezed
class CurrentWeatherEvent with _$CurrentWeatherEvent {
  factory CurrentWeatherEvent({required String zipCountryCode}) =
      _CurrentWeatherEvent;
}
