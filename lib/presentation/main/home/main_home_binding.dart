import 'package:get/get.dart';

import 'main_home_controller.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeController(
        Get.find(),
        // Get.find(),
        // Get.find(),
        Get.find()
    ));
  }
}