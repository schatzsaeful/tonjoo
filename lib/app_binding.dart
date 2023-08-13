import 'package:get/get.dart';
import 'package:tonjoo/domain/usecases/tonjoo/get_user_list_usecase.dart';

import 'data/local/prefs/app_preferences.dart';
import 'data/network/app_rest_api.dart';
import 'data/repositories/tonjoo_repository.dart';
import 'data/repositories/tonjoo_repository_impl.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    /// Database Daos
    // Get.put(UserDao());

    /// Preferences
    Get.put(AppPreferences());

    /// Services
    _registerApiServices();

    /// Repositores
    _registerRepositories();

    /// Usecases
    _registerUseCases();
  }

  void _registerApiServices() {
    /// Register any services here
    var restApi = AppRestApi();
    Get.put(restApi.getExampleService());
  }

  void _registerRepositories() {
    /// Register any repositories here
    Get.put<TonjooRepository>(TonjooRepositoryImpl(Get.find()));
  }

  void _registerUseCases() {
    /// Register any usecases here
    Get.put(GetUserListUseCase(Get.find()));
  }
}
