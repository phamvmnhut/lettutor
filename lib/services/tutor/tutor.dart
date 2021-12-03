import 'package:get/get.dart';
import 'package:lettutor/constants/strings.dart';

class TutorService extends GetConnect {
  final String loginUrl = "${Strings.apiUrl}/sign-in";
  final String registerUrl = "${Strings.apiUrl}/sign-up";
}