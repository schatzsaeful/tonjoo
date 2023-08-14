import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/app_translation.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../base/base_controller.dart';
import '../home/main_home_page.dart';

class MainAddNotesController extends BaseController {

  MainAddNotesController(
      AppPreferences pref,
      ) : super(pref, MainHomePage.name);

  final firstNameEditing = TextEditingController();
  final lastNameEditing = TextEditingController();
  final emailEditing = TextEditingController();

  List<String> genderList = [AppTranslation.textMale.tr, AppTranslation.textFemale.tr];
  Rx<int> selectedGenderIdx = (-1).obs;
  Rx<String> genderErrorMessage = ''.obs;

  void onGenderSelected(int? selectedIndex) {
    selectedGenderIdx.value = selectedIndex ?? -1;
    genderErrorMessage.value = '';
  }

  @override
  void onInit() {
    super.onInit();

  }

}
