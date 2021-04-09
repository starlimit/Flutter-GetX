import 'package:bottom_nav_test/app/data/helpers/helpers.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthApiClient extends GetConnect {
  //final http.Client api;
  final ApiBaseHelper helper;
  //AuthApiClient({@required this.api});
  AuthApiClient({@required this.helper});

  //ApiBaseHelper _helper = ApiBaseHelper();
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

// Post request
  // Future<LoginModel> verifyUser2(LoginModel data) async {
  //   print('${data.email}${data.password}');
  //   try {
  //     final response = await api.post(Uri.https(Config.API_URL, '/api/login'),
  //         body: {"email": data.email, "password": data.password});
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body); // Returns a Token
  //       LoginModel user = LoginModel.fromJson(jsonResponse);
  //       return user;
  //     } else {
  //       print('error');
  //       throw AuthenticationException(message: 'Wrong username or password');
  //     }
  //   } on AuthenticationException catch (e) {
  //     print('Auth Error ${e.message}');
  //     Get.snackbar('Auth Error', '${e.message}!',
  //         icon: Icon(Icons.error_rounded),
  //         backgroundColor: Colors.red[200],
  //         colorText: Colors.black,
  //         borderWidth: 2.0,
  //         borderColor: Colors.black,
  //         snackPosition: SnackPosition.TOP);
  //   } catch (err) {
  //     Get.snackbar('Error', err.toString());
  //     print(err.toString());
  //   }
  //   return null;
  // }
}
