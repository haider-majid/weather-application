import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';
import '../utils/weather_utils.dart';
import 'weather_colors.dart';

class WeatherTheme {
  static WeatherColors getWeatherColors(Weather weather) {
    final isDay = WeatherUtils.isDayTime(weather);
    final mainCondition = weather.description.toLowerCase();

    if (mainCondition.contains('thunderstorm')) {
      return WeatherColors(
        primaryColor: const Color(0xFF4A148C),
        secondaryColor: const Color(0xFF6A1B9A),
        cardColor: const Color(0xFF7B1FA2).withOpacity(0.7),
      );
    } else if (mainCondition.contains('rain') ||
        mainCondition.contains('drizzle')) {
      return WeatherColors(
        primaryColor: const Color(0xFF0D47A1),
        secondaryColor: const Color(0xFF1976D2),
        cardColor: const Color(0xFF2196F3).withOpacity(0.7),
      );
    } else if (mainCondition.contains('snow')) {
      return WeatherColors(
        primaryColor: const Color(0xFF01579B),
        secondaryColor: const Color(0xFF0288D1),
        cardColor: const Color(0xFF03A9F4).withOpacity(0.7),
      );
    } else if (mainCondition.contains('clear')) {
      return isDay
          ? WeatherColors(
              primaryColor: const Color(0xFF0288D1),
              secondaryColor: const Color(0xFF00BCD4),
              cardColor: const Color(0xFF4DD0E1).withOpacity(0.7),
            )
          : WeatherColors(
              primaryColor: const Color(0xFF0A0E3F),
              secondaryColor: const Color(0xFF1A237E),
              cardColor: const Color(0xFF303F9F).withOpacity(0.7),
            );
    } else if (mainCondition.contains('clouds')) {
      final temp = weather.temperature;
      if (temp > 25) {
        return WeatherColors(
          primaryColor: const Color(0xFFE65100),
          secondaryColor: const Color(0xFFF57C00),
          cardColor: const Color(0xFFFB8C00).withOpacity(0.7),
        );
      } else if (temp > 15) {
        return WeatherColors(
          primaryColor: const Color(0xFF616161),
          secondaryColor: const Color(0xFF757575),
          cardColor: const Color(0xFF9E9E9E).withOpacity(0.7),
        );
      } else {
        return WeatherColors(
          primaryColor: const Color(0xFF37474F),
          secondaryColor: const Color(0xFF455A64),
          cardColor: const Color(0xFF607D8B).withOpacity(0.7),
        );
      }
    }

    return WeatherColors(
      primaryColor: const Color(0xFF0097A7),
      secondaryColor: const Color(0xFF00ACC1),
      cardColor: const Color(0xFF26C6DA).withOpacity(0.7),
    );
  }

  static BoxDecoration getGradientDecoration(WeatherColors colors) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colors.primaryColor,
          colors.secondaryColor,
        ],
      ),
    );
  }

  static BoxDecoration getCardDecoration(WeatherColors colors) {
    return BoxDecoration(
      color: colors.cardColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static BoxDecoration getSearchDecoration(WeatherColors colors) {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.white.withOpacity(0.3),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          colors.cardColor.withOpacity(0.4),
          colors.secondaryColor.withOpacity(0.2),
        ],
      ),
    );
  }
}
