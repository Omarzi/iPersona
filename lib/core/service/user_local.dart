import '../config/routes/app.dart';

class UserLocal {
  static String? get token => CacheHelper.getData(key: MyCacheKey.token);
  static bool? get lang => CacheHelper.getData(key: MyCacheKey.lang);

}