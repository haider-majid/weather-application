import '../../domain/entities/weather.dart';

class WeatherUtils {
  static bool isDayTime(Weather weather) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return now > weather.sunrise && now < weather.sunset;
  }

  static String formatTemperature(double temperature) {
    return '${temperature.toStringAsFixed(0)}°';
  }

  static String formatWindSpeed(double speed) {
    return '$speed m/s';
  }

  static String formatPressure(int pressure) {
    return '$pressure hPa';
  }

  static String formatVisibility(int visibility) {
    return '${(visibility / 1000).toStringAsFixed(1)} km';
  }

  static String formatRainVolume(double volume) {
    return '$volume mm';
  }

  static String formatClouds(int clouds) {
    return '$clouds%';
  }

  static String formatHumidity(int humidity) {
    return '$humidity%';
  }
}
