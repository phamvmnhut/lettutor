import 'package:get_storage/get_storage.dart';
import 'package:lettutor/models/auth.dart';
import 'dart:convert';
import 'dart:developer' as dev;

mixin CacheManager {
  Future<bool> saveToken(TokenModel token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token.toJsonEncode());
    return true;
  }

  TokenModel? getToken() {
    final box = GetStorage();
    final token = box.read(CacheManagerKey.TOKEN.toString());
    if (token != null) {
      try {
        dev.log(token, name: 'get token');
        final tokenDecode = json.decode(token);
        dev.log(tokenDecode.toString(), name: 'decode token');
        return TokenModel.fromJson(tokenDecode);
      } catch (err) {
        print(err);
        return null;
      }
    }
    return null;
  }

  Future<bool> saveDarkMode(bool isDarkMode) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DARK_MODE.toString(), isDarkMode);
    return true;
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

enum CacheManagerKey { TOKEN, DARK_MODE }
