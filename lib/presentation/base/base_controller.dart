import 'dart:ui';

import 'package:get/get.dart';
import '../../data/local/prefs/app_preferences.dart';
import '../../domain/models/common/common_error.dart';
import '../../domain/models/common/common_error_type.dart';
import '../common/dialog/common_dialog.dart';

abstract class BaseController extends GetxController {
  final AppPreferences appPreferences;
  final String pageName ;

  BaseController(
      this.appPreferences,
      this.pageName
  );

  /// Clear token if unauthorized exception
  void handleError(
      CommonError error, {
        VoidCallback? callback,
      }) {
    if (error.errorType == CommonErrorType.unauthorizedException) {
      onLogout();
    }

    callback?.call();
  }

  void onLogout() {
    appPreferences.uid.val = '';
  }

  void showLoadingDialog() {
    var context = Get.context;
    if (context == null) return;

    CommonDialog.showLoadingDialog(context);
  }

  void hideLoadingDialog() {
    Get.back();
  }
}
