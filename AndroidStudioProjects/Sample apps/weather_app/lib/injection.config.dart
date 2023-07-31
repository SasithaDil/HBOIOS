// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'core/injectable_module.dart' as _i8;
import 'features/weather/data/api/weather_api.dart' as _i6;
import 'features/weather/data/repository/weather_repository.dart' as _i5;
import 'features/weather/domain/repository/i_weather_repository.dart' as _i4;
import 'features/weather/logic/weather/weather_bloc.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
  gh.lazySingleton<_i4.IweatherRepository>(
      () => _i5.WeatherRepository(gh<_i6.WeatherApi>()));
  gh.factory<_i7.WeatherBloc>(
      () => _i7.WeatherBloc(gh<_i4.IweatherRepository>()));
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}
