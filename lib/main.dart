import 'dart:async';
import 'package:lettutor/ui/my_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runZonedGuarded(() async {
    await GetStorage.init();
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}
