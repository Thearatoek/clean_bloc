// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

class CacheManager {
  factory CacheManager() => _singleton;

  CacheManager._();

  static final CacheManager _singleton = CacheManager._();

  AsyncMemoizer<String> permanentCache = AsyncMemoizer<String>();

  AsyncCache<String> temporaryCache =
      AsyncCache<String>(const Duration(seconds: 15));

  void invalidateTemporaryCache() {
    temporaryCache.invalidate();
  }
}
