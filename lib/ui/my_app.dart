import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/constants/app_theme.dart';
import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/services/theme.dart';
import 'package:lettutor/ui/auth/loading_auth.dart';
import 'package:lettutor/utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: themeData,
        darkTheme: themeDataDark,
        themeMode: ThemeService().theme,
        getPages: Routes.routes,
        home: LoadingAuthUI(),
        // initialBinding: HomeBinding(),
        navigatorObservers: [Routes.observer],
        // initialRoute: ,
      ),
    );
  }
}
