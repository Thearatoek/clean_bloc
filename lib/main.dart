import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_app_clean_bloc_test/helper/service_locator/di.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection();

  await dotenv.load(fileName: 'assets/.env');
  runApp(
    const MaterialApp(
      home: MYCurrentWeatherScreen(),
    ),
  );
}
