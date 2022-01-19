import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import "dart:developer" as dev;

class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    // if (name.isNotEmpty) AppPages.history.add(name);
    print('didPush');
    // print(AppPages.history);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null && previousRoute != null && previousRoute.settings.name != null) {
      if (route.settings.name == "/TutorSearchUI" && previousRoute.settings.name == "/") {
        dev.log("do did", name: "DID_ME");
        // final TutorCtrl _tutorCtrl = Get.find();
        // _tutorCtrl.getListTutor();
      }
    }
  }

  // @override
  // void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
  //   super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  //   if (newRoute != null) {
  //     var index = AppPages.history.indexWhere((element) {
  //       return element == oldRoute?.settings.name;
  //     });
  //     var name = newRoute.settings.name ?? '';
  //     if (name.isNotEmpty) {
  //       if (index > 0) {
  //         AppPages.history[index] = name;
  //       } else {
  //         AppPages.history.add(name);
  //       }
  //     }
  //   }
  //   print('didReplace');
  //   print(AppPages.history);
  // }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // AppPages.history.remove(route.settings.name);
    print('didRemove');
    // print(AppPages.history);
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
