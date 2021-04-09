import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//import 'app/modules/shared/not_found_page.dart';
void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //  unknownRoute: GetPage(name: '/not_found', page: () => UnknownRoutePage()),
      initialRoute: Routes.LOGIN, // '/home',
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}

//Credits : https://github.com/jonataslaw/getx/issues/799#issuecomment-730719165
