import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/prefs/app_preferences.dart';
import '../../../domain/models/common/common_error.dart';
import '../../../domain/models/common/common_error_type.dart';
import '../../../domain/usecases/example/get_todo_list_usecase.dart';
import '../../../utils/async_wrapper.dart';
import '../../base/base_controller.dart';
import '../home/main_home_page.dart';

class MainAddNotesController extends BaseController {
  late final GetTodoListUseCase _getTodoListUseCase;

  MainAddNotesController(
      AppPreferences pref,
      this._getTodoListUseCase
      ) : super(pref, MainHomePage.name);

  final scrollController = ScrollController();
  Rx<Async> unitListAsync = Async.uninitialized().obs;
  bool hasRetry = false;

  @override
  void onInit() {
    super.onInit();

  }

}
