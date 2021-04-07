import 'dart:convert';

import 'package:bottom_nav_test/app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseUrl = // 'https://jsonplaceholder.typicode.com/albums';
    '606cc5e5603ded00175029ee.mockapi.io';

class ProductApi extends GetConnect {
  final http.Client api;

  ProductApi({@required this.api});

  getProductList() async {
    try {
      final response = await api.get(Uri.https(baseUrl, 'Product'));
      if (response.statusCode == 200) {
        print('Data returned');
        Iterable jsonResponse = json.decode(response.body);
        List<ProductModel> listMyModel =
            jsonResponse.map((model) => ProductModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('error');
    } catch (err) {
      Get.snackbar('Error', err);
      print(err);
    }
  }
// Get request
  // Future<Response> getProductList() => get(baseUrl);
// Post request
//Future<Response> postProduct(Map data) => post('http://youapi/users', body: data);
// Post request with File
// Future<Response<CasesModel>> postCases(List<int> image) {
//   final form = FormData({
//     'file': MultipartFile(image, filename: 'avatar.png'),
//     'otherFile': MultipartFile(image, filename: 'cover.png'),
//   });
//   return post('http://youapi/users/upload', form);
// }
// GetSocket userMessages() {
//   return socket('https://yourapi/users/socket');
// }

}
