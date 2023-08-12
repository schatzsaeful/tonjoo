import 'package:get/get.dart';
import 'main_controllers.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(Get.find()));
  }
}
