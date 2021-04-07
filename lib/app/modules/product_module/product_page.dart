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
            ? Center(child: CircularProgressIndicator())
            : Obx(
                () => ListView.builder(
                    itemCount: _.productList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          final item = _.productList[index];
                          // direction == DismissDirection.endToStart
                          //     ?
                          //_.removeProduct(index);
                          //    : _.editProduct(index, _.productList[index]);
                          Get.defaultDialog(
                              title: 'Confirm',
                              onCancel: () => {},
                              onConfirm: () {
                                _.removeProduct(index);
                                Get.back();
                              },
                              middleText: "Confirm Delete of Product?");
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.green,
                          child: Align(
                            alignment: Alignment(-0.9, 0),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          child: Align(
                            alignment: Alignment(0.9, 0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        key: UniqueKey(),
                        child: ListTile(
                          onTap: () {},
                          title: Text(_.productList[index].title),
                          subtitle: Text(index.toString()),
                        ),
                      );
                    }),
              );
      })
          //  GetX<ProductController>(
          //     //autoRemove: false,
          //     //assignId: false,
          //     initState: (state) {
          //   Get.find<ProductController>().fetchProductList();
          // }, builder: (_) {
          //   return _.productList.isEmpty
          //       ? Center(
          //           child: CircularProgressIndicator(),
          //         )
          //       : ListView.separated(
          //           separatorBuilder: (context, index) => Divider(
          //                 height: 1,
          //               ),
          //           itemCount: _.productList.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               onTap: () {},
          //               title: Text(_.productList[index].title),
          //               subtitle: Text(index.toString()),
          //             );
          //           });
          // }),
          //Text('Product Controller'),
          ),
    );
  }
}
