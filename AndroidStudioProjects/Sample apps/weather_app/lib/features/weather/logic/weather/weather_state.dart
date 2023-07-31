part of 'weather_bloc.dart';

enum WeatherStateStatus { initial, loading, success, failure }

extension WeatherStateStatusX on WeatherStateStatus {
  bool get isInitial => this == WeatherStateStatus.initial;
  bool get isLoading => this == WeatherStateStatus.loading;
  bool get isSuccess => this == WeatherStateStatus.success;
  bool get isFailure => this == WeatherStateStatus.failure;
}

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    required WeatherStateStatus weatherStateStatus,
    required Main main,
    String? message,
  }) = _WeatherState;

  factory WeatherState.initial() => WeatherState(
        weatherStateStatus: WeatherStateStatus.initial,
        main: const Main(),
      );
}
