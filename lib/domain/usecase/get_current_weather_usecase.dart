import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
import 'package:todo_app_clean_bloc_test/domain/repository/get_current_weather_repository.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_future_use_case.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_input.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_output.dart';

part 'get_current_weather_usecase.freezed.dart';

@Injectable()
class GetCurrentWeatherUsecase extends BaseFutureUseCase<
    GetCurrentWeatherUsecaseInput, GetCurrentWeatherUsecaseOutput> {
  const GetCurrentWeatherUsecase(this._getCurrentWeatherRepository);

  final GetCurrentWeatherRepository _getCurrentWeatherRepository;

  @protected
  @override
  Future<GetCurrentWeatherUsecaseOutput> buildUseCase(
      GetCurrentWeatherUsecaseInput input) async {
    final response = await _getCurrentWeatherRepository
        .getCurrentWeatherRepository(zipCountryCode: input.zipCountryCode);

    return GetCurrentWeatherUsecaseOutput(currentWeatherModel: response);
  }
}

@freezed
class GetCurrentWeatherUsecaseInput extends BaseInput
    with _$GetCurrentWeatherUsecaseInput {
  factory GetCurrentWeatherUsecaseInput({required String zipCountryCode}) =
      _GetCurrentWeatherUsecaseInput;
}

@freezed
class GetCurrentWeatherUsecaseOutput extends BaseOutput
    with _$GetCurrentWeatherUsecaseOutput {
  factory GetCurrentWeatherUsecaseOutput(
          {CurrentWeatherModel? currentWeatherModel}) =
      _GetCurrentWeatherUsecaseOutput;
}
