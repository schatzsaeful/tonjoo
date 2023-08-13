import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../domain/models/common/common_error.dart';
import '../../../domain/usecases/tonjoo/get_user_list_usecase.dart';
import '../../../utils/async_wrapper.dart';
import '../../../utils/widget_util.dart';
import '../../base/base_controller.dart';
import '../home/main_home_page.dart';

class MainHomeController extends BaseController {
  late final GetUserListUseCase _getUserListUseCase;

  MainHomeController(
      AppPreferences pref,
      this._getUserListUseCase
      ) : super(pref, MainHomePage.name);

  final scrollController = ScrollController();
  Rx<Async> userListAsync = Async.uninitialized().obs;

  @override
  void onInit() {
    super.onInit();

    _getUserList();
  }

  void onRefresh() async {
    _getUserList();
  }

  void _getUserList() {
    userListAsync.value = Async.loading();

    var result = _getUserListUseCase.execute();

    result.fold((CommonError error) {
      WidgetUtil.showCommonToast(error.message);

    }, (data) {
      userListAsync.value = Async.success(data);
    });
  }
}
