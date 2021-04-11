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

  verifyUser() async {
    //  try {
    _loginStateStream.value = LoginLoading();
    // Login user
    var res = await repository.verifyUser(login);

    // Fetch User Details
    if (res != null && res.token != '') await fetchUser(res);
  }

  Future fetchUser(res) async {
    //Fetch User Info
    var user = await repository.fetchUser("2");
    if (user != null) {
      login.password = '';
      login.token = res.token;

      //Write to Storage
      userInfo.write('s_authInfo', login.toJson());
      userInfo.write('s_userInfo', user.toJson());
      _loginStateStream.value = LoginState();
      Get.offNamed(Routes.HOME);
    }
  }

  signOut() {
    userInfo.remove('s_userInfo');
    Get.offAllNamed(Routes.LOGIN);
  }
}
