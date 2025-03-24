import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int visibility;
  final String description;
  final String icon;
  final int sunrise;
  final int sunset;
  final int clouds;
  final double rainVolume;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.description,
    required this.icon,
    required this.sunrise,
    required this.sunset,
    required this.clouds,
    required this.rainVolume,
  });

  @override
  List<Object> get props => [
        cityName,
        temperature,
        feelsLike,
        tempMin,
        tempMax,
        humidity,
        windSpeed,
        pressure,
        visibility,
        description,
        icon,
        sunrise,
        sunset,
        clouds,
        rainVolume,
      ];
}
