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
      drawer: Obx(() => mainDrawer()),
      appBar: AppBar(
        title: Obx(() => Text(controller.currentPage.value)),
        actions: [
          // Obx(() => Text(controller.userInfo.avatar)),
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

  Widget mainDrawer() {
    final _currentIndex = controller.currentIndex.value;
    //final _currentPage = controller.currentPage.value;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: createDrawerHeader(),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text(RouteTitles.PRODUCT_LIST),
            // tileColor: Get.currentRoute == Routes.PRODUCT_LIST
            tileColor:
                _currentIndex == controller.pages.indexOf(Routes.PRODUCT_LIST)
                    ? Colors.grey[300]
                    : null,
            onTap: () {
              print(controller.currentIndex.value);
              Get.back();
              controller
                  .changePage(controller.pages.indexOf(Routes.PRODUCT_LIST));
              //Get.offAllNamed(Routes.PRODUCT_LIST);
            },
          ),
          ListTile(
            title: Text(RouteTitles.BROWSE),
            tileColor: _currentIndex == controller.pages.indexOf(Routes.BROWSE)
                ? Colors.grey[300]
                : null,
            onTap: () {
              print(controller.currentIndex.value);
              Get.back();
              controller.changePage(controller.pages.indexOf(Routes.BROWSE));
              //Get.offNamed(Routes.BROWSE);
            },
          ),
          ListTile(
            title: Text(RouteTitles.HISTORY),
            tileColor: _currentIndex == controller.pages.indexOf(Routes.HISTORY)
                ? Colors.grey[300]
                : null,
            onTap: () {
              print(controller.currentIndex.value);
              Get.back();
              controller.changePage(controller.pages.indexOf(Routes.HISTORY));
            },
          ),
        ],
      ),
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

  createDrawerHeader() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Image.network(controller.userInfo.avatar),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      '${controller.userInfo.firstName} ${controller.userInfo.lastName}'),
                  Text(controller.userInfo.email),
                ],
              )),
        ],
      ),
    );
  }
}
