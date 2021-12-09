import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<bool> saveDarkMode(bool isDarkMode) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DARK_MODE.toString(), isDarkMode);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  bool getDarkMode() {
    final box = GetStorage();
    return box.read<bool>(CacheManagerKey.DARK_MODE.toString()) ?? false;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey {
  TOKEN,
  DARK_MODE
}
