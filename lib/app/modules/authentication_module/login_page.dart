import 'package:bottom_nav_test/app/data/helpers/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

//Credits https://github.com/vince-nyanga/flutter_getx_authentication
//

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginPage'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(child: LoginForm()));
  }
}

class LoginForm extends GetView {
  final _ = AuthController.to;
  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey<FormState>();
    return Form(
      key: key,
      child: Obx(() => Column(
            children: <Widget>[
              TextFormField(
                initialValue: 'eve.holt@reqres.in',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _.login.email = value,
                decoration: InputDecoration(labelText: 'Email'),
                enableSuggestions: true,
                maxLength: 32,
                style: TextStyle(fontSize: 20),
                validator: (value) {
                  if (!isEmail(value)) {
                    return 'Invalid Email!';
                  } else
                    return null;
                },
              ),
              TextFormField(
                  initialValue: 'cityslicka',
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _.login.password = value,
                  decoration: InputDecoration(labelText: 'Password'),
                  enableSuggestions: true,
                  obscureText: true,
                  maxLength: 20,
                  style: TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 5) {
                      return 'Password minimum length is 5';
                    } else
                      return null;
                  }),
              ElevatedButton(
                onPressed: _.state is LoginLoading
                    ? null
                    : () async {
                        final FormState form = key.currentState;
                        form.validate() ? submitForm(form) : formError();
                      },
                child: Text('OK'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_.state is LoginFailure)
                Text(
                  (_.state as LoginFailure).error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Get.theme.errorColor),
                ),
              if (_.state is LoginLoading)
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          )),
    );
  }

  void submitForm(FormState form) {
    // Get.dialog(Center(
    //   child: CircularProgressIndicator(),
    // ));

    form.save();
    _.verifyUser();
  }

  void formError() {
    print('Error in form');
    Get.snackbar('Error', 'Error in form',
        backgroundColor: Colors.red[400], snackPosition: SnackPosition.BOTTOM);
  }

  bool isEmail(String value) {
    return true;
  }
}
