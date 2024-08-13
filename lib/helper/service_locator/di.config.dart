// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_app_clean_bloc_test/data/local/real_time_data_local.dart'
    as _i725;
import 'package:todo_app_clean_bloc_test/data/repository/api/base/connectivity_interception.dart'
    as _i770;
import 'package:todo_app_clean_bloc_test/data/repository/api/dio_builder.dart'
    as _i152;
import 'package:todo_app_clean_bloc_test/data/repository/api/get_product_api_client.dart'
    as _i129;
import 'package:todo_app_clean_bloc_test/data/repository/service/get_current_weather_service.dart'
    as _i774;
import 'package:todo_app_clean_bloc_test/data/repositoryImp/get_current_weather_repositoryImp.dart'
    as _i935;
import 'package:todo_app_clean_bloc_test/domain/repository/get_current_weather_repository.dart'
    as _i858;
import 'package:todo_app_clean_bloc_test/domain/usecase/get_current_weather_usecase.dart'
    as _i757;
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart'
    as _i883;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i770.ConnectivityInterceptor>(
        () => _i770.ConnectivityInterceptor());
    gh.lazySingleton<_i152.HeaderInterceptor>(() => _i152.HeaderInterceptor());
    gh.lazySingleton<_i725.LocalDataStore>(() => _i725.LocalDataStore());
    gh.factory<_i152.AccessTokenInterceptor>(
        () => _i152.AccessTokenInterceptor(gh<_i725.LocalDataStore>()));
    gh.lazySingleton<_i129.GetCurrentWeather>(() => _i129.GetCurrentWeather(
          gh<_i152.HeaderInterceptor>(),
          gh<_i152.AccessTokenInterceptor>(),
        ));
    gh.lazySingleton<_i774.GetCurrentWeatherService>(
        () => _i774.GetCurrentWeatherService(gh<_i129.GetCurrentWeather>()));
    gh.factory<_i858.GetCurrentWeatherRepository>(() =>
        _i935.GetCurrentWeatherRepositoryimp(
            gh<_i774.GetCurrentWeatherService>()));
    gh.factory<_i757.GetCurrentWeatherUsecase>(() =>
        _i757.GetCurrentWeatherUsecase(
            gh<_i858.GetCurrentWeatherRepository>()));
    gh.factory<_i883.BlocBloc>(
        () => _i883.BlocBloc(gh<_i757.GetCurrentWeatherUsecase>()));
    return this;
  }
}
