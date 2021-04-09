import 'package:bottom_nav_test/app/data/helpers/helpers.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthApiClient extends GetConnect {
  final ApiBaseHelper helper;
  AuthApiClient({@required this.helper});

// Post request
  Future<LoginModel> verifyUser(LoginModel data) async {
    print('${data.email}${data.password}');
    try {
      final response = await helper.post(
          Config.LOGIN_POST, {"email": data.email, "password": data.password});
      LoginModel user = LoginModel.fromJson(response);
      return user;
    } catch (err) {
      Get.snackbar('Error', '${err.toString()}!',
          icon: Icon(Icons.error_rounded),
          backgroundColor: Colors.red[200],
          colorText: Colors.black,
          borderWidth: 2.0,
          borderColor: Colors.black,
          snackPosition: SnackPosition.TOP);
      print(err.toString());
    }
    return null;
  }
}
