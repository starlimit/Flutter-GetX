import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'browse_controller.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Browse')),
      body: Center(
        child: Container(
          child: Text(Get.find<BrowseController>().title.value),
        ),
      ),
    );
  }
}
