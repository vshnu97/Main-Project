import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/signup/model/signup_model.dart';
import 'package:main_project/app/signup/view/screen_otp.dart';

class SignUpProv extends ChangeNotifier {
  final signUpPhoneNumControler = TextEditingController();
  final signUpnameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUppasswrdController = TextEditingController();
  final signUpConfrmController = TextEditingController();

  bool isObscure = true;
  bool isobscureConfirm = true;

  passwordHide() {
    isObscure = !isObscure;
    notifyListeners();
  }

  passwordHideConfirm() {
    isobscureConfirm = !isobscureConfirm;
    notifyListeners();
  }

  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  signInDataBase(BuildContext context) async {
    String psswrd2 = signUppasswrdController.text.trim();
    String psswrd1 = signUpConfrmController.text.trim();
    String name = signUpnameController.text;
    String email = signUpEmailController.text.trim();
    String phone = signUpPhoneNumControler.text;

    if (psswrd2 != psswrd1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          duration: Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 215, 6, 6),
          margin: EdgeInsets.all(20),
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Text(
              'Password Does not Match',
              style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w500),
            ),
          )));
    } else {
      final dataQ = SignUpModelClass(
          firstName: name,
          lastName: name,
          phone: phone,
          email: email,
          password: psswrd2,
          confirmPassword: psswrd1);
      try {
        Response response = await dio.post(Url.signUp, data: dataQ.toJson());

        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          log(response.data.toString());
          //  RoutesScreen().pushScreen(context, const ScreenOtp());
          Routes.push(screen: const ScreenOtp());
          disposeSignupPage(context);
        } else {
          pop(context, response.statusCode.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void disposeSignupPage(BuildContext context) {
    signUpPhoneNumControler.clear();
    signUpnameController.clear();
    signUpEmailController.clear();
    signUppasswrdController.clear();
    signUpConfrmController.clear();
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
