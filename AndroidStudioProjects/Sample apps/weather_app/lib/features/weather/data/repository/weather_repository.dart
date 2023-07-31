import 'package:injectable/injectable.dart';
import 'package:test/features/weather/data/api/weather_api.dart';
import 'package:test/features/weather/data/dto/weather_dto.dart';
import 'package:test/features/weather/domain/repository/i_weather_repository.dart';

@LazySingleton(as: IweatherRepository)
class WeatherRepository implements IweatherRepository {
  final WeatherApi _weatherApi;

  WeatherRepository(
    this._weatherApi,
  );

  @override
  Future<WeatherDTO> getWeatherDetails() async {
    WeatherDTO weatherDTO = await _weatherApi.getWeatherData();
    return weatherDTO;
  }
}
