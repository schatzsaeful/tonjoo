import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/utils/value_extension.dart';

import '../../../app_translation.dart';
import '../../common/common_color.dart';
import '../../common/widget/common_button_primary.dart';
import '../../common/widget/common_dropdown_textfield.dart';
import '../../common/widget/common_outline_textfield.dart';
import 'main_add_notes_controller.dart';

class MainAddNotesPage extends GetView<MainAddNotesController> {
  static const name = '/add-notes';

  const MainAddNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CommonColor.softerGrey,
      body: CustomScrollView(
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 8,
                        shadowColor: Colors.white.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 8),
                                child: CommonOutlineTextField(
                                  textEditingController: controller.firstNameEditing,
                                  label: AppTranslation.textFirstName.tr,
                                  hint: AppTranslation.textFirstName.tr,
                                  icon: const Icon(
                                      Icons.person
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                                child: CommonOutlineTextField(
                                  textEditingController: controller.lastNameEditing,
                                  label: AppTranslation.textLastName.tr,
                                  hint: AppTranslation.textLastName.tr,
                                  icon: const Icon(
                                      Icons.person
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 40, right: 8),
                                child: CommonDropdownTextField(
                                  label: AppTranslation.textGender.tr,
                                  hint: AppTranslation.textGender.tr,
                                  dropdownItems: controller.genderList.toList(),
                                  selectedListener: controller.onGenderSelected,
                                  lastSelected: controller.selectedGenderIdx.value,
                                  errorText: controller.genderErrorMessage.value.nullIfEmpty()
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                                child: CommonOutlineTextField(
                                  textEditingController: controller.emailEditing,
                                  label: AppTranslation.textEmail.tr,
                                  hint: AppTranslation.textEmail.tr,
                                  icon: const Icon(
                                      Icons.mail
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      margin: const EdgeInsets.only(top: 32),
                      width: double.infinity,
                      child: CommonButtonPrimary(
                        onPressed: () {},
                        text: AppTranslation.textSave.tr,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}