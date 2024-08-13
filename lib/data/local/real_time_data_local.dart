import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalDataStore {
  String? _accessToken;

  set accessToken(String accessToken) => _accessToken = accessToken;

  String get accessToken => _accessToken ?? '';
}
