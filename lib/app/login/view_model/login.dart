import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/model/login_model.dart';
import 'package:main_project/app/login/model/response_model.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/login/view_model/api/api.dart';
import 'package:main_project/app/routes/routes.dart';

class HomeProv extends ChangeNotifier {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  bool isLoading = false;
  callLoginAPI() async {
    isLoading = true;
    notifyListeners();
    if (loginEmailController.text.isEmpty || passwordController.text.isEmpty) {
      pop('Enter all fields');
      return;
    }
    final email = loginEmailController.text;
    final password = passwordController.text;
    final dataQ = LoginModelClass(email: email, password: password);
    ResponseLoginModel? response = await API().loginUser(dataQ);
    if (response != null) {
      if (response.status!) {
        Routes.pushreplace(screen: const ScreenHome());
      } else {
        pop(response.message.toString());
      }
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
}
