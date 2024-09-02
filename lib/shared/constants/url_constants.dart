import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlConstants {
  UrlConstants._();
  static String apiKey = dotenv.get('apiKey');
  static const String currentWeather = "current.json{zipCode}";

  static String get domainApiBaseUrl {
    return 'https://api.weatherapi.com/v1/';
  }
}
