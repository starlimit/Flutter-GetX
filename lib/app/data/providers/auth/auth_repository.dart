import 'package:bottom_nav_test/app/data/models/login_model.dart';
import 'package:bottom_nav_test/app/data/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final AuthApiClient apiClient;

  AuthRepository({@required this.apiClient}) : assert(apiClient != null);

  verifyUser(LoginModel login) {
    return apiClient.verifyUser(login);
  }
}
