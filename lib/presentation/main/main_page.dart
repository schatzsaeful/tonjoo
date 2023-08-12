import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_translation.dart';
import '../common/common_color.dart';
import '../common/common_icon.dart';
import 'home/main_home_page.dart';
import 'main_controllers.dart';

class MainPage extends GetView<MainController> {
  static const name = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Obx(() =>
          Scaffold(
            body: Navigator(
              key: Get.nestedKey(controller.getNavigatorId()),
              initialRoute: MainHomePage.name,
              onGenerateRoute: controller.onGenerateRoute,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: CommonIcon.home,
                  activeIcon: CommonIcon.activeHome,
                  label: AppTranslation.textHome.tr,
                ),
                BottomNavigationBarItem(
                  icon: CommonIcon.add,
                  activeIcon: CommonIcon.activeAdd,
                  label: AppTranslation.textAddNew.tr,
                ),
                BottomNavigationBarItem(
                  icon: CommonIcon.logout,
                  activeIcon: CommonIcon.activeLogout,
                  label: AppTranslation.textLogout.tr,
                ),
              ],
              currentIndex: controller.pageIndex.value,
              selectedItemColor: CommonColor.purple,
              unselectedItemColor: CommonColor.darkGrey,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14,
              unselectedFontSize: 12,
              onTap: controller.changePage,
            ),
          ),
      ),
    );
  }
}