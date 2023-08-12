import 'package:get/get.dart';

import 'data/local/prefs/app_preferences.dart';
import 'data/network/app_rest_api.dart';
import 'data/repositories/example_repository.dart';
import 'data/repositories/example_repository_impl.dart';
import 'domain/usecases/example/get_todo_list_usecase.dart';

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
    Get.put<ExampleRepository>(ExampleRepositoryImpl(Get.find()));
  }

  void _registerUseCases() {
    /// Register any usecases here
    Get.put(GetTodoListUseCase(Get.find()));
  }
}
