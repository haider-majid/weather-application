import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/weather/presentation/pages/weather_page.dart';
import '../../features/weather/presentation/bloc/weather_bloc.dart';
import '../di/injection.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<WeatherBloc>(),
          child: const WeatherPage(),
        ),
      ),
    ],
  );
}
