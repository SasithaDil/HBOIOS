import 'package:http/http.dart' as http;
import 'package:test/core/api_client.dart';
import 'package:test/features/weather/data/dto/weather_dto.dart';

class WeatherApi {
  final http.Client _client;

  WeatherApi({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<WeatherDTO> getWeatherData() async {
    const url =
        "https://api.openweathermap.org/data/2.5/weather?lat=7.290572&lon=80.633728&appid=bd58e804710b33acf8a05ef04767a8a4";

    return weatherDTOFromJson(await apiClient(
      url: url,
      client: _client,
      apiMethodStatus: ApiMethodStatus.get,
    ));
  }
}
