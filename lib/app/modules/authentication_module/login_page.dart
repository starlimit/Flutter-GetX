import 'package:flutter/material.dart';
import 'package:get/get.dart';
//Credits https://github.com/vince-nyanga/flutter_getx_authentication
import 'auth_controller.dart';

// class LoginPage extends GetView<AuthController> {
//   final _ = AuthController.to;
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey key = GlobalKey<FormState>();
//     return Form(
//       key: key,
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (value) => _.login.email = value,
//             decoration: InputDecoration(labelText: 'Email'),
//             enableSuggestions: true,
//             maxLength: 32,
//             style: TextStyle(fontSize: 20),
//             validator: (value) {
//               if (!isEmail(value)) {
//                 return 'Insira um email válido';
//               } else
//                 return null;
//             },
//           ),
//           TextFormField(
//               keyboardType: TextInputType.text,
//               onSaved: (value) => _.login.password = value,
//               decoration: InputDecoration(labelText: 'Senha'),
//               enableSuggestions: true,
//               obscureText: true,
//               maxLength: 20,
//               style: TextStyle(fontSize: 20),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Insira uma senha';
//                 } else if (value.length < 5) {
//                   return 'Insira uma senha maior';
//                 } else
//                   return null;
//               }),
//           ElevatedButton(
//             onPressed: () {
//               final FormState form = key.currentState;
//               form.validate() ? form.save() : print('erro ao logar');
//               print(_.login.email);
//               print(_.login.password);
//               _.login();
//             },
//             child: Text('OK'),
//           )
//         ],
//       ),
//     );
//   }

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
      child: Column(
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
            onPressed: () async {
              final FormState form = key.currentState;
              form.validate() ? submitForm(form) : formError();
            },
            child: Text('OK'),
          )
        ],
      ),
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
