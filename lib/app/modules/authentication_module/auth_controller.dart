import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/providers/auth/auth.dart';
import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({@required this.repository}) : assert(repository != null);

  static AuthController get to => Get.find();

  final _login = LoginModel().obs;
  get login => this._login.value;
  set login(value) => this._login.value = value;

  verifyUser() {
    //  try {
    repository.verifyUser(login).then((res) {
      // TO: Save User Details in Storage
      if (res != null && res.token != '') {
        print('${res.token}');
        Get.offNamed(Routes.HOME);
      }
    });
    //  }
  }

  signOut() {
    Get.offNamed(Routes.LOGIN);
  }
}
