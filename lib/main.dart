import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/firebase/firebase_messaging.dart';
import 'package:todo_app_clean_bloc_test/firebase_options.dart';
import 'package:todo_app_clean_bloc_test/helper/service_locator/di.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather_screen.dart';

Future<void> main() async {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // init awesome notification
  FirebaseNotificationHandler.init();
  //recieve message on background
  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationHandler.firebaseMessagingBackgroundHandler);

  //
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
