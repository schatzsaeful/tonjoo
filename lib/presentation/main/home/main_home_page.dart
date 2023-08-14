import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tonjoo/app_translation.dart';

import '../../../domain/models/tonjoo/user_dto.dart';
import '../../common/common_color.dart';
import 'main_home_controller.dart';
import 'main_home_widget.dart';

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
              backgroundColor: CommonColor.orange,
              elevation: 5,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Text(
                AppTranslation.textListUser.tr,
                style: const TextStyle(
                  color: CommonColor.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                splashRadius: 24,
                icon: const Icon(
                  Icons.arrow_back,
                  color: CommonColor.white,
                ),
              ),
              floating: false,
              pinned: true,
              snap: false,
              primary: true,
              forceElevated: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Obx(() =>
                      MainNotesList(
                        async: controller.userListAsync.value,
                        itemClickListener: (UserDto data) {

                        },
                        onRetry: () {},
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}