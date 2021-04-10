import 'package:bottom_nav_test/app/data/helpers/helpers.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/models/user_model.dart';
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

  Future<UserModel> fetchUser(String id) async {
    /*   
    "data": {
        "id": 2,
        "email": "janet.weaver@reqres.in",
        "first_name": "Janet",
        "last_name": "Weaver",
        "avatar": "https://reqres.in/img/faces/2-image.jpg"
    },
    */
    try {
      final response = await helper.get(Config.USER_GET + '/$id');
      print(response['data']);
      var x = response['data'];
      return UserModel.fromJson(x);
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
