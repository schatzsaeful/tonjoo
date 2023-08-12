import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../domain/usecases/example/get_todo_list_usecase.dart';
import '../../../utils/async_wrapper.dart';
import '../base/base_controller.dart';
import 'auth_login_page.dart';

class AuthLoginController extends BaseController {
  late final GetTodoListUseCase _getTodoListUseCase;

  AuthLoginController(
      AppPreferences pref,
      this._getTodoListUseCase
      ) : super(pref, AuthLoginPage.name);

  final scrollController = ScrollController();
  Rx<Async> unitListAsync = Async.uninitialized().obs;
  bool hasRetry = false;

  final usernameEditing = TextEditingController();
  final passwordEditing = TextEditingController();

  RxBool isPasswordShown = false.obs;

  void togglePasswordShown(bool isShown) {
    isPasswordShown.value = isShown;
  }

  void onLogin() {
    showLoadingDialog();

    // var result = _authLoginUseCase.execute(
    //   username: usernameEditing.text,
    //   password: passwordEditing.text,
    // );
    //
    // result.fold((CommonError error) {
    //   hideLoadingDialog();
    //
    //   if (error.errorType == CommonErrorType.accountInactive) {
    //     _onShowDialogAccountInactive(usernameEditing.text);
    //   } else {
    //     WidgetUtil.showCommonToast(error.message);
    //   }
    // }, (data) {
    //   hideLoadingDialog();
    //
    //   appPreferences.token.val = data.accessToken;
    //   appPreferences.firstSurvey.val = true;
    //
    //   Get.back(result: true);
    // });
  }

  @override
  void onInit() {
    super.onInit();

  }
}
