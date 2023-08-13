import 'package:get/get.dart';

import 'main_add_notes_controller.dart';

class MainAddNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainAddNotesController(Get.find()));
  }
}