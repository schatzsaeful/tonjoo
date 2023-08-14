import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/app_translation.dart';
import 'package:tonjoo/presentation/auth/auth_login_page.dart';
import 'package:tonjoo/presentation/main/add_notes/main_add_notes_page.dart';

import '../../data/local/prefs/app_preferences.dart';
import '../base/base_controller.dart';
import 'MainArgs.dart';
import 'add_notes/main_add_notes_binding.dart';
import 'home/main_home_binding.dart';
import 'home/main_home_page.dart';
import 'main_page.dart';

class MainController extends BaseController {

  MainController(
      AppPreferences preferences,
      ) : super(preferences, MainPage.name);

  final pages = [
    MainHomePage.name,
    MainAddNotesPage.name,
    AppTranslation.textLogout.tr
  ];

  RxInt pageIndex = 0.obs;
  MainArgs? args = Get.arguments;

  @override
  void onInit() {
    Future.delayed(const Duration(microseconds: 500), () {
      changePage(args?.pageIndex ?? 0);
    });

    super.onInit();
  }

  int getNavigatorId() {
    return 1;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case MainHomePage.name:
        return GetPageRoute(
          settings: settings,
          page: () => const MainHomePage(),
          transition: Transition.noTransition,
          binding: MainHomeBinding(),
        );
      case MainAddNotesPage.name:
        return GetPageRoute(
          settings: settings,
          page: () => const MainAddNotesPage(),
          transition: Transition.noTransition,
          binding: MainAddNotesBinding(),
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => const MainHomePage(),
          transition: Transition.noTransition,
          binding: MainHomeBinding(),
        );
    }
  }

  void changePage(int selectedIndex) {
    if (selectedIndex > 1) {
      onLogout();

      Get.offAllNamed(AuthLoginPage.name);
    } else {
      pageIndex.value = selectedIndex;
      Get.offNamed(
        pages[selectedIndex],
        id: getNavigatorId(),
        arguments: args,
      );
    }
  }

  Future<bool> onBackPressed() async {
    if (pageIndex.value > 0) {
      changePage(0);
      return false;
    }

    return true;
  }
}