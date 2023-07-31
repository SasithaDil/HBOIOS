
import 'package:test/features/weather/data/dto/weather_dto.dart';

abstract class IweatherRepository {
  Future <WeatherDTO> getWeatherDetails();
}