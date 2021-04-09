import 'package:badges/badges.dart';
import 'package:bottom_nav_test/app/modules/authentication_module/auth_controller.dart';
import 'package:bottom_nav_test/app/modules/product_module/product.dart';
import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';

class HomePage extends GetView<HomeController> {
  final ProductController productController = ProductController.to;
  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.currentPage.value)),
        actions: [
          Obx(() => Text(controller.userInfo.email)),
          Obx(() => _shoppingCartBadge(productController.productList.length)),
          IconButton(
              icon: Icon(Icons.settings_power, color: Colors.red),
              onPressed: () => authController.signOut())
        ],
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.PRODUCT_LIST,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() => BottomNavyBar(
            selectedIndex: controller.currentIndex.value,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: controller.changePage,
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.shopping_bag),
                  title: Text('Products'),
                  activeColor: Colors.green),
              BottomNavyBarItem(
                icon: Icon(Icons.search),
                title: Text('Browse'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.history),
                  title: Text('History'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.blue),
            ],
          )),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         label: 'Browse',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.history),
      //         label: 'History',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.settings),
      //         label: 'Settings',
      //       ),
      //     ],
      //     currentIndex: controller.currentIndex.value,
      //     selectedItemColor: Colors.pink,
      //     onTap: controller.changePage,
      //   ),
    );
  }

  Widget _shoppingCartBadge(counter) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.fade,
      badgeContent: Text(
        counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }
}
