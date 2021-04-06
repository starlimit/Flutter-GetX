import 'package:bottom_nav_test/app/modules/home_module/home_controller.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.currentPage.value))),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/browse',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() => BottomNavyBar(
            selectedIndex: controller.currentIndex.value,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: controller.changePage,
            items: [
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
}
