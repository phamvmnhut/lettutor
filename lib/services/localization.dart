import 'dart:collection';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:lettutor/controller/cache_manager.dart';

import '../utils/languages/st_en_us.dart';
import '../utils/languages/st_vi_vn.dart';

import 'dart:developer' as dev;

class LocalizationService extends Translations with CacheManager {

  Locale get local => _getLocaleFromLanguage(langCode: getLanguage())!;

  static final fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'vi',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    dev.log(locale!.languageCode, name: "local");
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    String lang = langCode ?? Get.deviceLocale!.languageCode;
    dev.log(lang, name: "Lang");
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}
