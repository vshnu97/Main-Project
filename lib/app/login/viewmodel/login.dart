import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/model/model.dart';
import 'package:main_project/app/routes/routes.dart';

class HomeProv extends ChangeNotifier {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final url = 'http://10.0.2.2:8000/user/login/';

  loginDataBase(BuildContext context) async {
    final email = loginEmailController.text;
    final password = passwordController.text;
    final dataQ = LoginModelClass(email: email, password: password);

    try {
      final result = await Dio().post(url, data: dataQ.toJson());

      if (result.statusCode! >= 200 && result.statusCode! <= 299) {
        RoutesScreen().pushScreen(context, const ScreenHome());
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
}
