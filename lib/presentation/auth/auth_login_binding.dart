import 'package:get/get.dart';

import 'auth_login_controller.dart';

class AuthLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthLoginController(Get.find(), Get.find()));
  }
}