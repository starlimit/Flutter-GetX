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
}
