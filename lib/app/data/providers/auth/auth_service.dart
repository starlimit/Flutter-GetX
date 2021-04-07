import 'package:bottom_nav_test/app/data/models/user_model.dart';
import 'package:get/get.dart';

abstract class AuthenticationService extends GetxService {
  Future<UserModel> getCurrentUser();
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurrentUser() async {
    // simulated delay
    await Future.delayed(Duration(seconds: 20));
    return null;
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 20));

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      throw AuthenticationException(message: 'Wrong username or password');
    }

    return null; // UserModel(name: 'Test User', email: email);
  }

  @override
  Future<void> signOut() {
    return null;
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
