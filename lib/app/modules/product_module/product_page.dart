import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ProductPage')),
      body: SafeArea(
        child: GetX<ProductController>(
            //autoRemove: false,
            //assignId: false,
            initState: (state) {
          Get.find<ProductController>().fetchProductList();
        }, builder: (_) {
          return _.productList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 1,
                      ),
                  itemCount: _.productList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(_.productList[index].title),
                      subtitle: Text(index.toString()),
                    );
                  });
        }),
        //Text('Product Controller'),
      ),
    );
  }
}
