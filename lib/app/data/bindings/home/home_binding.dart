import 'package:bottom_nav_test/app/data/providers/auth/auth.dart';
import 'package:bottom_nav_test/app/data/providers/auth/auth_repository.dart';
import 'package:bottom_nav_test/app/data/providers/product/product.dart';
import 'package:bottom_nav_test/app/modules/authentication_module/auth_controller.dart';
import 'package:bottom_nav_test/app/modules/home_module/home_controller.dart';
import 'package:bottom_nav_test/app/modules/product_module/product_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() {
      return ProductController(
          repository:
              ProductRepository(apiClient: ProductApi(api: http.Client())));
    });
    Get.lazyPut<AuthController>(
      () => AuthController(
        repository: AuthRepository(
          apiClient: AuthApiClient(
            api: http.Client(),
          ),
        ),
      ),
    );
  }
}
