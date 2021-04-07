import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/shared/not_found_page.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    unknownRoute: GetPage(name: '/not_found', page: () => UnknownRoutePage()),
    initialRoute: Routes.HOME, // '/home',
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    // getPages: [
    //   GetPage(
    //     name: '/home',
    //     page: () => HomePage(),
    //     binding: HomeBinding(),
    //   ),
    //   GetPage(
    //     name: '/another',
    //     page: () => AnotherPage(),
    //   ),
    // ],
  ));
}

//Credits : https://github.com/jonataslaw/getx/issues/799#issuecomment-730719165
