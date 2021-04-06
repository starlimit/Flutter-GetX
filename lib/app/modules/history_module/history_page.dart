import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'history_controller.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('History')),
      body: Center(
        child: Container(
          child: Text(Get.find<HistoryController>().title.value),
        ),
      ),
    );
  }
}
