// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_app_clean_bloc_test/data/local/real_time_data_local.dart'
    as _i5;
import 'package:todo_app_clean_bloc_test/data/repository/api/base/connectivity_interception.dart'
    as _i3;
import 'package:todo_app_clean_bloc_test/data/repository/api/client/get_product_api_client.dart'
    as _i6;
import 'package:todo_app_clean_bloc_test/data/repository/api/dio_builder.dart'
    as _i4;
import 'package:todo_app_clean_bloc_test/data/repository/service/get_current_weather_service.dart'
    as _i7;
import 'package:todo_app_clean_bloc_test/data/repositoryImp/get_current_weather_repositoryImp.dart'
    as _i9;
import 'package:todo_app_clean_bloc_test/domain/repository/get_current_weather_repository.dart'
    as _i8;
import 'package:todo_app_clean_bloc_test/domain/usecase/get_current_weather_usecase.dart'
    as _i10;
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart'
    as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ConnectivityInterceptor>(
        () => _i3.ConnectivityInterceptor());
    gh.lazySingleton<_i4.HeaderInterceptor>(() => _i4.HeaderInterceptor());
    gh.lazySingleton<_i5.LocalDataStore>(() => _i5.LocalDataStore());
    gh.factory<_i4.AccessTokenInterceptor>(
        () => _i4.AccessTokenInterceptor(gh<_i5.LocalDataStore>()));
    gh.lazySingleton<_i6.GetCurrentWeatherClient>(
        () => _i6.GetCurrentWeatherClient(
              gh<_i4.HeaderInterceptor>(),
              gh<_i4.AccessTokenInterceptor>(),
            ));
    gh.lazySingleton<_i7.GetCurrentWeatherService>(
        () => _i7.GetCurrentWeatherService(gh<_i6.GetCurrentWeatherClient>()));
    gh.factory<_i8.GetCurrentWeatherRepository>(() =>
        _i9.GetCurrentWeatherRepositoryimp(gh<_i7.GetCurrentWeatherService>()));
    gh.factory<_i10.GetCurrentWeatherUsecase>(() =>
        _i10.GetCurrentWeatherUsecase(gh<_i8.GetCurrentWeatherRepository>()));
    gh.factory<_i11.WeatherBloc>(
        () => _i11.WeatherBloc(gh<_i10.GetCurrentWeatherUsecase>()));
    return this;
  }
}
