import 'package:get/get.dart';

import '../loading.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoadingCtrl>(LoadingCtrl());
  }
}
