import 'package:bottom_nav_test/app/data/bindings/browse/browse_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/history/history_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/home/home_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/settings/settings_binding.dart';
import 'package:bottom_nav_test/app/modules/browse_module/browse_page.dart';
import 'package:bottom_nav_test/app/modules/history_module/history_page.dart';
import 'package:bottom_nav_test/app/modules/settings_module/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;
  final currentPage = ''.obs;

  final pages = <String>['/browse', '/history', '/settings'];
  final pageTitles = <String>['Browse', 'History', 'Settings'];

  void changePage(int index) {
    currentIndex.value = index;
    currentPage.value = pageTitles[index];
    //  Get.toNamed(pages[index], id: 1);
    Get.offAndToNamed(pages[index], id: 1);
    //navigator.popAndPushNamed(pages[index]);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/browse')
      return GetPageRoute(
        settings: settings,
        page: () => BrowsePage(),
        binding: BrowseBinding(),
      );

    if (settings.name == '/history')
      return GetPageRoute(
        settings: settings,
        page: () => HistoryPage(),
        binding: HistoryBinding(),
      );

    if (settings.name == '/settings')
      return GetPageRoute(
        settings: settings,
        page: () => SettingsPage(),
        binding: SettingsBinding(),
      );

    return null;
  }
}
