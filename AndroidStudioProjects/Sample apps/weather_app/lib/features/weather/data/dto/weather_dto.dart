// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

WeatherDTO weatherDTOFromJson(String str) => WeatherDTO.fromJson(json.decode(str));

String weatherDTOToJson(WeatherDTO data) => json.encode(data.toJson());

@freezed
class WeatherDTO with _$WeatherDTO {
    const factory WeatherDTO({
        Coord? coord,
        List<Weather>? weather,
        String? base,
        Main? main,
        int? visibility,
        Wind? wind,
        Clouds? clouds,
        int? dt,
        Sys? sys,
        int? timezone,
        int? id,
        String? name,
        int? cod,
    }) = _WeatherDTO;

    factory WeatherDTO.fromJson(Map<String, dynamic> json) => _$WeatherDTOFromJson(json);
}

@freezed
class Clouds with _$Clouds {
    const factory Clouds({
        int? all,
    }) = _Clouds;

    factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Coord with _$Coord {
    const factory Coord({
        double? lon,
        double? lat,
    }) = _Coord;

    factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Main with _$Main {
    const factory Main({
        double? temp,
        double? feelsLike,
        double? tempMin,
        double? tempMax,
        int? pressure,
        int? humidity,
        int? seaLevel,
        int? grndLevel,
    }) = _Main;

    factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
    const factory Sys({
        String? country,
        int? sunrise,
        int? sunset,
    }) = _Sys;

    factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
    const factory Weather({
        int? id,
        String? main,
        String? description,
        String? icon,
    }) = _Weather;

    factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
    const factory Wind({
        double? speed,
        int? deg,
        double? gust,
    }) = _Wind;

    factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
