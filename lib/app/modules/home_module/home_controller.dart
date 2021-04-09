import 'package:bottom_nav_test/app/data/bindings/browse/browse_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/history/history_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/product/product_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/settings/settings_binding.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/modules/browse_module/browse_page.dart';
import 'package:bottom_nav_test/app/modules/history_module/history_page.dart';
import 'package:bottom_nav_test/app/modules/product_module/product_page.dart';
import 'package:bottom_nav_test/app/modules/settings_module/settings_page.dart';
import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;
  final currentPage = ''.obs;

  final _storage = GetStorage();

  final _userInfo = LoginModel().obs;
  get userInfo => this._userInfo.value;
  set userInfo(value) => this._userInfo.value = value;

  HomeController() {
    userInfo = LoginModel.fromJson(_storage.read('s_userInfo'));
    print('==>${this.userInfo.token.toString()}');
  }
  final pages = <String>[
    Routes.PRODUCT_LIST,
    Routes.BROWSE,
    Routes.HISTORY,
    Routes.SETTINGS
  ];
  final pageTitles = <String>[
    RouteTitles.PRODUCT_LIST,
    RouteTitles.BROWSE,
    RouteTitles.HISTORY,
    RouteTitles.SETTINGS
  ];

  void changePage(int index) {
    currentIndex.value = index;
    currentPage.value = pageTitles[index];
    //  Get.toNamed(pages[index], id: 1);
    Get.offAndToNamed(pages[index], id: 1);
    //navigator.popAndPushNamed(pages[index]);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.BROWSE)
      return GetPageRoute(
        settings: settings,
        page: () => BrowsePage(),
        binding: BrowseBinding(),
      );

    if (settings.name == Routes.HISTORY)
      return GetPageRoute(
        settings: settings,
        page: () => HistoryPage(),
        binding: HistoryBinding(),
      );

    if (settings.name == Routes.SETTINGS)
      return GetPageRoute(
        settings: settings,
        page: () => SettingsPage(),
        binding: SettingsBinding(),
      );

    if (settings.name == Routes.PRODUCT_LIST)
      return GetPageRoute(
        settings: settings,
        page: () => ProductPage(),
        binding: ProductBinding(),
      );
    return null;
  }
}
