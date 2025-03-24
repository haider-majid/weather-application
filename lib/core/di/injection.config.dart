// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:weather_app/core/network/network_info.dart' as _i866;
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart'
    as _i355;
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i530;
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart'
    as _i504;
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart'
    as _i129;
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart'
    as _i950;

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
    gh.factory<_i355.WeatherRemoteDataSource>(
        () => _i355.WeatherRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i866.NetworkInfo>(
        () => _i866.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.factory<_i504.WeatherRepository>(() => _i530.WeatherRepositoryImpl(
          gh<_i355.WeatherRemoteDataSource>(),
          gh<_i866.NetworkInfo>(),
        ));
    gh.factory<_i129.GetWeather>(
        () => _i129.GetWeather(gh<_i504.WeatherRepository>()));
    gh.factory<_i950.WeatherBloc>(
        () => _i950.WeatherBloc(gh<_i129.GetWeather>()));
    return this;
  }
}
