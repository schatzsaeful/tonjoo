import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/data/network/requests/auth_request.dart';
import 'package:tonjoo/domain/usecases/tonjoo/post_login_usecase.dart';
import 'package:tonjoo/presentation/main/main_page.dart';
import 'package:tonjoo/utils/widget_util.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../utils/async_wrapper.dart';
import '../../domain/models/common/common_error.dart';
import '../base/base_controller.dart';
import 'auth_login_page.dart';

class AuthLoginController extends BaseController {
  late final PostLoginUseCase _postLoginUseCase;

  AuthLoginController(
      AppPreferences pref,
      this._postLoginUseCase
      ) : super(pref, AuthLoginPage.name);

  final scrollController = ScrollController();
  Rx<Async> unitListAsync = Async.uninitialized().obs;
  bool hasRetry = false;
  RxBool hasNetwork = false.obs;

  final usernameEditing = TextEditingController();
  final passwordEditing = TextEditingController();

  RxBool isPasswordShown = false.obs;

  void togglePasswordShown(bool isShown) {
    isPasswordShown.value = isShown;
  }

  void onLogin() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      WidgetUtil.showCommonToast("Tidak terdapat koneksi internet");
    } else {
      showLoadingDialog();

      var result = _postLoginUseCase.execute(
          AuthRequest(
              username: usernameEditing.text,
              password: passwordEditing.text
          )
      );

      result.fold((CommonError error) {
        hideLoadingDialog();

        WidgetUtil.showCommonToast("Username atau password salah");
      }, (data) {
        hideLoadingDialog();

        appPreferences.token.val = data.token;

        Get.toNamed(MainPage.name);
      });
    }
  }

  void checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      hasNetwork.value = false;
    } else {
      hasNetwork.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }
}
