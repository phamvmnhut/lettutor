import 'package:flutter/material.dart';
import 'package:lettutor/features/cache_manager.dart';

class ThemeService with CacheManager {
  ThemeMode get theme => getDarkMode() ? ThemeMode.dark : ThemeMode.light;

}
