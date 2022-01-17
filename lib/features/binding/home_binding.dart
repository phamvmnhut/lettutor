import 'package:get/get.dart';
import 'package:lettutor/features/tutor.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TutorCtrl());
  }
}
