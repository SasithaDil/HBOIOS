// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';
part 'weather_entity.g.dart';

WeatherEntity weatherEntityFromJson(String str) => WeatherEntity.fromJson(json.decode(str));

String weatherEntityToJson(WeatherEntity data) => json.encode(data.toJson());

@freezed
class WeatherEntity with _$WeatherEntity {
    const factory WeatherEntity({
        Coord? coord,
    }) = _WeatherEntity;

    factory WeatherEntity.fromJson(Map<String, dynamic> json) => _$WeatherEntityFromJson(json);
}

@freezed
class Coord with _$Coord {
    const factory Coord({
        double? lon,
        double? lat,
    }) = _Coord;

    factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
