import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        backgroundColor: CommonColor.softerGrey,
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
                    child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 8,
                        shadowColor: Colors.white.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                                child: CommonOutlineTextField(
                                  textEditingController: controller.usernameEditing,
                                  label: AppTranslation.textUsername.tr,
                                  hint: AppTranslation.textUsername.tr,
                                  icon: const Icon(
                                    Icons.person
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24, left: 16, right: 8),
                                child: Obx(() =>
                                    CommonPasswordTextField(
                                      textEditingController: controller.passwordEditing,
                                      label: AppTranslation.textPassword.tr,
                                      hint: AppTranslation.textPassword.tr,
                                      isPasswordShown: controller.isPasswordShown.value,
                                      toggleListener: controller.togglePasswordShown,
                                      icon: const Icon(
                                          Icons.lock
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 32),
                  width: double.infinity,
                  child: Obx(() =>
                      CommonButtonPrimary(
                        onPressed: controller.onLogin,
                        text: AppTranslation.textLogin.tr,
                        isEnable: controller.hasNetwork.value,
                      ),
                  )
                ),
              ],
            ),
          ),
        )
    );
  }
}