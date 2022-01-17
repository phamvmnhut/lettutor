import 'package:get/get.dart';
import 'package:lettutor/features/tutor.dart';

class TutorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorCtrl>(
            () => TutorCtrl());
  }
}
