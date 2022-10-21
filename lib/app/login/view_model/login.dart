import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/api%20service/api.dart';
import 'package:main_project/app/login/model/login_model.dart';
import 'package:main_project/app/login/model/response_model.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/routes/routes.dart';

class HomeProv extends ChangeNotifier {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  bool isLoading = false;
  callLoginAPI() async {
    if (loginEmailController.text.isEmpty || passwordController.text.isEmpty) {
      pop('Enter all fields');
      return;
    }
    isLoading = true;
    notifyListeners();
    final email = loginEmailController.text;
    final password = passwordController.text;
    final dataQ = LoginModelClass(email: email, password: password);
    ResponseLoginModel? response = await API().loginUser(dataQ);
    if (response != null) {
      _hideLoading();
      log(response.status.toString());
      if (response.status!) {
        storedataLogin(response);
        Routes.pushreplace(screen: const ScreenHome());
      } else {
        pop(
          response.message.toString(),
        );
      }
    }
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    passwordController.dispose();
    super.dispose();
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

  FlutterSecureStorage storage = const FlutterSecureStorage();
  storedataLogin(ResponseLoginModel value) async {
    await storage.write(key: "token", value: value.token);
    await storage.write(key: "refreshToken", value: value.refresh);
    await storage.write(key: 'userID', value: value.id.toString());
    await storage.write(key: "login", value: "true");
  }

  // getToken() async {
  //   return await storage.read(key: 'token');
  // }

  // getRefreshToken() async {
  //   return await storage.read(key: 'refreshToken');
  // }
}
