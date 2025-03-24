import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';
import '../theme/weather_theme.dart';
import '../utils/weather_utils.dart';
import 'common/weather_common_widgets.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weatherColors = WeatherTheme.getWeatherColors(weather);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weatherColors.primaryColor,
            weatherColors.secondaryColor,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
            child: Column(
              children: [
                Text(
                  weather.cityName,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('EEEE, MMMM d').format(DateTime.now()),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      WeatherUtils.formatTemperature(weather.temperature),
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      weather.description.toUpperCase(),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getWeatherIcon(weather),
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherTempIndicator(
                  text:
                      '${'weather.high'.tr()}: ${WeatherUtils.formatTemperature(weather.tempMax)}',
                  icon: Icons.arrow_upward,
                ),
                WeatherTempIndicator(
                  text:
                      '${'weather.low'.tr()}: ${WeatherUtils.formatTemperature(weather.tempMin)}',
                  icon: Icons.arrow_downward,
                ),
                WeatherTempIndicator(
                  text:
                      '${'weather.feels'.tr()} ${WeatherUtils.formatTemperature(weather.feelsLike)}',
                  icon: Icons.thermostat,
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                WeatherDetailCard(
                  icon: Icons.water_drop,
                  title: 'weather.humidity',
                  value: WeatherUtils.formatHumidity(weather.humidity),
                  cardColor: weatherColors.cardColor,
                ),
                WeatherDetailCard(
                  icon: Icons.air,
                  title: 'weather.wind',
                  value: WeatherUtils.formatWindSpeed(weather.windSpeed),
                  cardColor: weatherColors.cardColor,
                ),
                WeatherDetailCard(
                  icon: Icons.speed,
                  title: 'weather.pressure',
                  value: WeatherUtils.formatPressure(weather.pressure),
                  cardColor: weatherColors.cardColor,
                ),
                WeatherDetailCard(
                  icon: Icons.visibility,
                  title: 'weather.visibility',
                  value: WeatherUtils.formatVisibility(weather.visibility),
                  cardColor: weatherColors.cardColor,
                ),
                if (weather.rainVolume > 0)
                  WeatherDetailCard(
                    icon: Icons.umbrella,
                    title: 'weather.rain',
                    value: WeatherUtils.formatRainVolume(weather.rainVolume),
                    cardColor: weatherColors.cardColor,
                  ),
                WeatherDetailCard(
                  icon: Icons.cloud,
                  title: 'weather.clouds',
                  value: WeatherUtils.formatClouds(weather.clouds),
                  cardColor: weatherColors.cardColor,
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeatherSunTime(
                  title: 'weather.sunrise',
                  time: DateTime.fromMillisecondsSinceEpoch(
                      weather.sunrise * 1000),
                  icon: Icons.wb_sunny,
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.white.withOpacity(0.3),
                ),
                WeatherSunTime(
                  title: 'weather.sunset',
                  time: DateTime.fromMillisecondsSinceEpoch(
                      weather.sunset * 1000),
                  icon: Icons.nightlight_round,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(Weather weather) {
    final mainCondition = weather.description.toLowerCase();
    if (mainCondition.contains('thunderstorm')) {
      return Icons.flash_on;
    } else if (mainCondition.contains('rain') ||
        mainCondition.contains('drizzle')) {
      return Icons.beach_access;
    } else if (mainCondition.contains('snow')) {
      return Icons.ac_unit;
    } else if (mainCondition.contains('clear')) {
      return WeatherUtils.isDayTime(weather)
          ? Icons.wb_sunny
          : Icons.nightlight;
    } else if (mainCondition.contains('clouds')) {
      return Icons.cloud;
    }
    return Icons.wb_sunny;
  }
}
