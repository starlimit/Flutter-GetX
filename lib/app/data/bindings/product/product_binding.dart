import 'package:bottom_nav_test/app/data/providers/product/product.dart';
import 'package:bottom_nav_test/app/modules/product_module/product_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() {
      return ProductController(
          repository:
              ProductRepository(apiClient: ProductApi(api: http.Client())));
    });
  }
}
