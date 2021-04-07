import 'package:bottom_nav_test/app/data/providers/auth/auth_provider.dart';
import 'package:bottom_nav_test/app/data/providers/auth/auth_repository.dart';
import 'package:bottom_nav_test/app/modules/authentication_module/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthBinding implements Bindings {
  @override
  void dependencies() {
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
