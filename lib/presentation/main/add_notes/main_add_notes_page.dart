import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app_translation.dart';
import '../../common/common_color.dart';
import 'main_add_notes_controller.dart';

class MainAddNotesPage extends GetView<MainAddNotesController> {
  static const name = '/add-notes';

  const MainAddNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CommonColor.purple90,
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
              backgroundColor: CommonColor.purple90,
              leadingWidth: 0,
              elevation: 5,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                AppTranslation.textAddAgent.tr,
                style: const TextStyle(
                  color: CommonColor.purple,
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