import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../bloc/weather_bloc.dart';
import '../theme/weather_theme.dart';
import '../theme/weather_colors.dart';

class WeatherSearch extends StatelessWidget {
  const WeatherSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale.languageCode;
    final weatherState = context.watch<WeatherBloc>().state;
    final weatherColors = weatherState is WeatherLoaded
        ? WeatherTheme.getWeatherColors(weatherState.weather)
        : WeatherColors(
            primaryColor: Colors.blue.shade600,
            secondaryColor: Colors.indigo.shade800,
            cardColor: Colors.blue.shade400,
          );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: WeatherTheme.getSearchDecoration(weatherColors),
      child: TextField(
        key: ValueKey(currentLocale),
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'weather.search'.tr(),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.white.withOpacity(0.8),
            size: 24,
          ),
        ),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.read<WeatherBloc>().add(GetWeatherForCity(value.trim()));
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }
}
