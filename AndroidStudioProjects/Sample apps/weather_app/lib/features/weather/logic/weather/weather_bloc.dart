// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:test/features/weather/data/dto/weather_dto.dart';
import 'package:test/features/weather/domain/repository/i_weather_repository.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IweatherRepository iweatherRepository;
  WeatherBloc(this.iweatherRepository)
      : super(
          WeatherState.initial(),
        ) {
    on<WeatherEvent>(
      (event, emit) async {
      },
    );
  }
}
