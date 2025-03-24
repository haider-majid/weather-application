import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/weather.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather {
  const WeatherModel({
    required String cityName,
    required double temperature,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int humidity,
    required double windSpeed,
    required int pressure,
    required int visibility,
    required String description,
    required String icon,
    required int sunrise,
    required int sunset,
    required int clouds,
    required double rainVolume,
  }) : super(
          cityName: cityName,
          temperature: temperature,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          humidity: humidity,
          windSpeed: windSpeed,
          pressure: pressure,
          visibility: visibility,
          description: description,
          icon: icon,
          sunrise: sunrise,
          sunset: sunset,
          clouds: clouds,
          rainVolume: rainVolume,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather =
        (json['weather'] as List<dynamic>)[0] as Map<String, dynamic>;
    final wind = json['wind'] as Map<String, dynamic>;
    final sys = json['sys'] as Map<String, dynamic>;
    final clouds = json['clouds'] as Map<String, dynamic>;
    final rain = json['rain'] as Map<String, dynamic>?;

    return WeatherModel(
      cityName: json['name'] as String,
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      tempMin: (main['temp_min'] as num).toDouble(),
      tempMax: (main['temp_max'] as num).toDouble(),
      humidity: main['humidity'] as int,
      windSpeed: (wind['speed'] as num).toDouble(),
      pressure: main['pressure'] as int,
      visibility: json['visibility'] as int,
      description: weather['description'] as String,
      icon: weather['icon'] as String,
      sunrise: sys['sunrise'] as int,
      sunset: sys['sunset'] as int,
      clouds: clouds['all'] as int,
      rainVolume: (rain?['1h'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
