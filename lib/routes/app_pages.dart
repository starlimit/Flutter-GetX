import 'package:bottom_nav_test/app/data/bindings/browse/browse_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/history/history_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/home/home_binding.dart';
import 'package:bottom_nav_test/app/data/bindings/settings/settings_binding.dart';
import 'package:bottom_nav_test/pages/another_page.dart';
import 'package:bottom_nav_test/app/modules/browse_module/browse_page.dart';
import 'package:bottom_nav_test/app/modules/history_module/history_page.dart';
import 'package:bottom_nav_test/app/modules/home_module/home_page.dart';
import 'package:bottom_nav_test/app/modules/settings_module/settings_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.BROWSE,
      page: () => BrowsePage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: Routes.ANOTHER,
      page: () => AnotherPage(),
    ),
  ];
}
