import 'package:bottom_nav_test/app/data/helpers/api_response.dart';
import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/providers/auth/auth.dart';
import 'package:bottom_nav_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({@required this.repository}) : assert(repository != null);

  static AuthController get to => Get.find();

  final _login = LoginModel().obs;
  get login => this._login.value;
  set login(value) => this._login.value = value;
  final userInfo = GetStorage();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  verifyUser() {
    //  try {
    _loginStateStream.value = LoginLoading();

    repository.verifyUser(login).then((res) {
      // TO: Save User Details in Storage
      _loginStateStream.value = LoginState();
      if (res != null && res.token != '') {
        login.password = '';
        login.token = res.token;
        //Write to Storage
        userInfo.write('s_userInfo', login.toJson());
        // var x = userInfo.read('s_userInfo');
        // print('${res.token}.....${x.toString()}');
        Get.offNamed(Routes.HOME);
      }
    }).catchError((err) {});
    //  }
  }

  signOut() {
    userInfo.remove('s_userInfo');
    Get.offNamed(Routes.LOGIN);
  }
}
