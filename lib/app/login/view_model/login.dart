import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/model/model.dart';
import 'package:main_project/app/routes/routes.dart';

class HomeProv extends ChangeNotifier {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

  loginDataBase(BuildContext context) async {
    validator(context);
    final email = loginEmailController.text;
    final password = passwordController.text;
    final dataQ = LoginModelClass(email: email, password: password);

    try {
      final result = await dio.post(Url.login, data: dataQ.toJson());
      log(result.toString());

      if (result.statusCode! >= 200 && result.statusCode! <= 299) {
        //RoutesScreen().pushScreen(context, const ScreenHome());
        Routes.push(screen: const ScreenHome());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  bool isObscure = true;
  passwordHide() {
    isObscure = !isObscure;
    notifyListeners();
  }

  String? customValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please fill this field';
    }

    return null;
  }

  validator(BuildContext context) {
    if (loginEmailController.text.isEmpty || passwordController.text.isEmpty) {
      return pop(context, 'Enter all fields');
    }
  }

  pop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 215, 6, 6),
        margin: const EdgeInsets.all(20),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Text(
            msg,
            style:
                const TextStyle(letterSpacing: 2, fontWeight: FontWeight.w500),
          ),
        )));
  }
}
