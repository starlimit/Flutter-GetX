import 'dart:convert';

import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseUrl = //'http://gerador-nomes.herokuapp.com/nomes/10';
    '606cc5e5603ded00175029ee.mockapi.io';

class AuthApiClient extends GetConnect {
  final http.Client api;
  AuthApiClient({@required this.api});

// Post request
  Future<UserModel> verifyUser(LoginModel data) async {
    try {
      final response = await api.get(Uri.https(baseUrl, 'users/200'));
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

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
