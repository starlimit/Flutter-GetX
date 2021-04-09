import 'dart:convert';

import 'package:bottom_nav_test/app/data/exceptions/authentication_exception.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/models/user_model.dart';
import 'package:bottom_nav_test/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'reqres.in';
// '606cc5e5603ded00175029ee.mockapi.io';

class AuthApiClient extends GetConnect {
  final http.Client api;
  AuthApiClient({@required this.api});

// Post request
  Future<LoginModel> verifyUser(LoginModel data) async {
    print('${data.email}${data.password}');
    try {
      final response = await api.post(Uri.https(Config.apiUrl, '/api/login'),
          body: {"email": data.email, "password": data.password});
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body); // Returns a Token
        LoginModel user = LoginModel.fromJson(jsonResponse);

        return user;
      } else {
        print('error');
        throw AuthenticationException(message: 'Wrong username or password');
      }
    } on AuthenticationException catch (e) {
      print('Error ${e.message}');
      Get.snackbar('Error', '${e.message}!',
          icon: Icon(Icons.error_rounded),
          backgroundColor: Colors.red[200],
          colorText: Colors.black,
          borderWidth: 2.0,
          borderColor: Colors.black,
          snackPosition: SnackPosition.TOP);
    } catch (err) {
      Get.snackbar('Error', err.toString());
      print(err.toString());
    }
    return null;
  }

// Post request
  Future<UserModel> verifyUser2(LoginModel data) async {
    try {
      final response = await api.get(Uri.https(baseUrl, '/api/login'));
      if (response.statusCode == 200) {
        print('Data returned');
        var jsonResponse = json.decode(response.body);
        UserModel user = UserModel.fromJson(jsonResponse);
        return user;
      } else {
        print('error');
        throw AuthenticationException(message: 'Wrong username or password');
      }
    } on AuthenticationException catch (e) {
      print('Error ${e.message}');
      Get.snackbar('Error', '${e.message}!',
          icon: Icon(Icons.error_rounded),
          backgroundColor: Colors.red[200],
          colorText: Colors.black,
          borderWidth: 2.0,
          borderColor: Colors.black,
          snackPosition: SnackPosition.TOP);
    } catch (err) {
      Get.snackbar('Error', 'Error fetching Data');
      print(err);
    }
    return null;
  }
}
