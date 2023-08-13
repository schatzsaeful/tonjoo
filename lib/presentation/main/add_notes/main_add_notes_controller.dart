import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../utils/async_wrapper.dart';
import '../../base/base_controller.dart';
import '../home/main_home_page.dart';

class MainAddNotesController extends BaseController {

  MainAddNotesController(
      AppPreferences pref,
      ) : super(pref, MainHomePage.name);

  final scrollController = ScrollController();
  Rx<Async> unitListAsync = Async.uninitialized().obs;
  bool hasRetry = false;

  @override
  void onInit() {
    super.onInit();

  }

}
