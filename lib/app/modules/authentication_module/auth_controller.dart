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
    print('$login.email $login.password}');
    repository.verifyUser(login).then((user) {
      // TO: Save User Details in Storage
      if (user != null) {
        print('${user.firstName}');
        Get.offNamed(Routes.HOME);
      } //else
      //Get.back();
      // else {
      //   Get.snackbar('Error ', 'Invalid Credentials',
      //       colorText: Colors.white,
      //       backgroundColor: Colors.red,
      //       snackPosition: SnackPosition.BOTTOM);
      // }
    });
    //  }
  }

  signOut() {
    Get.offNamed(Routes.LOGIN);
  }
  //   void signOut() async {
  //   await _authenticationService.signOut();
  //   _authenticationStateStream.value = UnAuthenticated();
  // }

  // void _getAuthenticatedUser() async {
  //   _authenticationStateStream.value = AuthenticationLoading();

  //   final user = await _authenticationService.getCurrentUser();

  //   if (user == null) {
  //     _authenticationStateStream.value = UnAuthenticated();
  //   } else {
  //     _authenticationStateStream.value = Authenticated(user: user);
  //   }
  // }
}
