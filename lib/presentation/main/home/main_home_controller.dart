import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/domain/usecases/tonjoo/get_local_list_user_usecase.dart';
import 'package:tonjoo/domain/usecases/tonjoo/save_local_list_user_usecase.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../domain/models/common/common_error.dart';
import '../../../domain/usecases/tonjoo/get_user_list_usecase.dart';
import '../../../utils/async_wrapper.dart';
import '../../../utils/widget_util.dart';
import '../../base/base_controller.dart';
import '../home/main_home_page.dart';

class MainHomeController extends BaseController {
  late final GetUserListUseCase _getUserListUseCase;
  late final GetLocalUserUseCase _getLocalUserUseCase;
  late final SaveLocalUserUseCase _saveLocalUserUseCase;

  MainHomeController(
      AppPreferences pref,
      this._getUserListUseCase,
      this._getLocalUserUseCase,
      this._saveLocalUserUseCase
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
      getLocalUserList();
    }, (data) {
      _saveLocalUserUseCase.execute(data);

      userListAsync.value = Async.success(data);
      getLocalUserList();
    });
  }

  void getLocalUserList() async {
    var data = await _getLocalUserUseCase.execute();

    userListAsync.value = Async.success(data);
  }

}
