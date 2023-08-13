import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_translation.dart';
import '../../common/common_color.dart';
import 'main_add_notes_controller.dart';

class MainAddNotesPage extends GetView<MainAddNotesController> {
  static const name = '/add-notes';

  const MainAddNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CommonColor.white,
      body: CustomScrollView(
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
              AppTranslation.textCreateUser.tr,
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
        ],
      ),
    );
  }
}