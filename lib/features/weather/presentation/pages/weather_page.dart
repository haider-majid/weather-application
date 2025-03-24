import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/core/extensions/context_extensions.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/weather_display.dart';
import '../widgets/weather_search.dart';
import '../theme/weather_theme.dart';
import '../theme/weather_colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        WeatherColors weatherColors;
        if (state is WeatherLoaded) {
          weatherColors = WeatherTheme.getWeatherColors(state.weather);
        } else {
          weatherColors = WeatherColors(
            primaryColor: Colors.blue.shade600,
            secondaryColor: Colors.indigo.shade800,
            cardColor: Colors.blue.shade400,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'app.title'.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(FluentIcons.local_language_16_filled,
                    color: Colors.white),
                onPressed: () => context.toggleLanguage(),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: WeatherTheme.getGradientDecoration(weatherColors),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight + 50),
                  const WeatherSearch(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _buildWeatherContent(context, state),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeatherContent(BuildContext context, WeatherState state) {
    if (state is WeatherLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.white.withOpacity(0.8),
        ),
      );
    } else if (state is WeatherLoaded) {
      return SingleChildScrollView(
        child: WeatherDisplay(weather: state.weather),
      );
    } else if (state is WeatherError) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_city_rounded,
                size: 64,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(height: 16),
              Text(
                'weather.error.city_not_found_message'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
