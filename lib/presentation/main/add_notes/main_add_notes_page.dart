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
            backgroundColor: CommonColor.white,
            leadingWidth: 0,
            elevation: 5,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              AppTranslation.textAddAgent.tr,
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
    );
  }
}