import 'package:get/get.dart';
import '../tutor.dart';

class TutorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorCtrl>(
            () => TutorCtrl());
  }
}
