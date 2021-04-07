part of './app_pages.dart';

abstract class Routes {
  static const NOT_FOUND = '/not_found';
  static const HOME = '/home';
  static const BROWSE = '/browse';
  static const HISTORY = '/history';
  static const SETTINGS = '/settings';
  static const PRODUCT_LIST = '/product_list';
  static const ANOTHER = '/another';
}

abstract class RouteTitles {
  static const NOT_FOUND = 'Page not Found!';
  static const HOME = 'Home';
  static const BROWSE = 'Browse';
  static const HISTORY = 'History';
  static const SETTINGS = 'Settings';
  static const PRODUCT_LIST = 'Product List';
  static const ANOTHER = 'Another';
}
