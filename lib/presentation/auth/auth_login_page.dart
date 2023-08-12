import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tonjoo/presentation/common/common_widgets.dart';

import '../../../app_translation.dart';
import '../common/common_color.dart';
import '../common/widget/common_button_primary.dart';
import '../common/widget/common_outline_textfield.dart';
import '../common/widget/common_password_textfield.dart';
import 'auth_login_controller.dart';

class AuthLoginPage extends GetView<AuthLoginController> {
  static const name = '/login';

  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CommonColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Image.asset(
                    'assets/icons/ic_tonjoo.png',
                    height: 85,
                    fit: BoxFit.fitHeight,
                  )
              ),
              Text(
                AppTranslation.textLogin.tr,
                style: const TextStyle(
                  color: CommonColor.orange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonWidget.spacer12,
              Text(
                AppTranslation.textMessageLogin.tr,
                style: const TextStyle(
                  color: CommonColor.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CommonOutlineTextField(
                  textEditingController: controller.usernameEditing,
                  label: AppTranslation.textUsername.tr,
                  hint: AppTranslation.textUsername.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Obx(
                      () => CommonPasswordTextField(
                    textEditingController: controller.passwordEditing,
                    label: AppTranslation.textPassword.tr,
                    hint: AppTranslation.textPassword.tr,
                    isPasswordShown: controller.isPasswordShown.value,
                    toggleListener: controller.togglePasswordShown,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32),
                width: double.infinity,
                child: CommonButtonPrimary(
                  onPressed: controller.onLogin,
                  text: AppTranslation.textLogin.tr,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}