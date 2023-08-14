import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tonjoo/presentation/auth/auth_login_binding.dart';
import 'package:tonjoo/presentation/auth/auth_login_page.dart';
import 'package:tonjoo/presentation/main/add_notes/main_add_notes_binding.dart';
import 'package:tonjoo/presentation/main/add_notes/main_add_notes_page.dart';
import 'package:tonjoo/presentation/main/home/main_home_binding.dart';
import 'package:tonjoo/presentation/main/home/main_home_page.dart';
import 'package:tonjoo/presentation/main/main_binding.dart';
import 'package:tonjoo/presentation/main/main_page.dart';

import 'app_binding.dart';
import 'app_constant.dart';
import 'app_translation.dart';
import 'data/local/db/app_database.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  await AppDatabase.initAppDatabase();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(AppConstant.storageKey);
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());

}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tonjoo',
      initialRoute: AuthLoginPage.name,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('id', 'ID'),
      getPages: [
        GetPage(
          name: MainPage.name,
          page: () => const MainPage(),
          binding: MainBinding(),
        ),
        GetPage(
          name: MainHomePage.name,
          page: () => const MainHomePage(),
          binding: MainHomeBinding(),
        ),
        GetPage(
          name: MainAddNotesPage.name,
          page: () => const MainAddNotesPage(),
          binding: MainAddNotesBinding(),
        ),
        GetPage(
          name: AuthLoginPage.name,
          page: () => const AuthLoginPage(),
          binding: AuthLoginBinding(),
        ),
      ],
    );
  }
}