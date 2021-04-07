import 'package:bottom_nav_test/app/data/models/product_model.dart';
import 'package:bottom_nav_test/app/data/providers/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository repository;
  ProductController({@required this.repository}) : assert(repository != null);
  final _productList = [].obs;
  final product = ProductModel().obs;

  set productList(value) => this._productList.value = value;
  get productList => this._productList;
  static ProductController get to => Get.find();
  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }

  fetchProductList() {
    print('in controller fetching products');
    repository.getProductList().then((res) => {this.productList = res});
  }

  editProduct(index, item) {
    print('edit Product=>$index $item.tojson()');
    return;
  }

  removeProduct(index) {
    _productList.removeAt(index);
    print('remove Product=> ${productList.length}');
    return;
  }
}
