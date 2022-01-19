import 'package:get/get.dart';
import '../tutor.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TutorCtrl());
  }
}
