import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tonjoo/app_translation.dart';

import '../../common/common_color.dart';
import 'main_home_controller.dart';

class MainHomePage extends GetView<MainHomeController> {
  static const name = '/home';

  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CommonColor.white,
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () {
          controller.onRefresh();

          Future.delayed(const Duration(seconds: 1), () {
            refreshController.refreshToIdle();
          });
        },
        header: const ClassicHeader(
          completeDuration: Duration.zero,
        ),
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: CommonColor.white,
              leadingWidth: 0,
              elevation: 5,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                AppTranslation.textAgentsList.tr,
                style: const TextStyle(
                  color: CommonColor.orange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              floating: false,
              pinned: true,
              snap: false,
              primary: true,
              forceElevated: false,
            ),
          ],
        ),
      ),
    );
  }
}