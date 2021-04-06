import 'package:bottom_nav_test/app/modules/browse_module/browse_controller.dart';
import 'package:get/get.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}
