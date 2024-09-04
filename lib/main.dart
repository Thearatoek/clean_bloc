import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_app_clean_bloc_test/helper/service_locator/di.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection();
  await dotenv.load(fileName: 'assets/.env');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WeatherBloc>(),
        ),
      ],
      child: const CurrentWeatherScreen(),
    ),
  ));
}
