import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/signup/api_service/api_service_signup.dart';
import 'package:main_project/app/signup/model/response_signup.dart';
import 'package:main_project/app/signup/model/signup_model.dart';
import 'package:main_project/app/signup/view/screen_otp.dart';

class SignUpProv extends ChangeNotifier {
  final signUpPhoneNumControler = TextEditingController();
  final signUpnameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUppasswrdController = TextEditingController();
  final signUpConfrmController = TextEditingController();
  bool isLoading = false;
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
  callSignUpAPI(BuildContext context) async {
    String psswrd2 = signUppasswrdController.text.trim();
    String psswrd1 = signUpConfrmController.text.trim();
    String name = signUpnameController.text;
    String email = signUpEmailController.text.trim();
    String phone = signUpPhoneNumControler.text;
    if (phone.isEmpty || name.isEmpty || email.isEmpty) {
      pop('Enter all fields');
      return;
    } else if (psswrd1.isEmpty) {
      pop('Enter the password');
      return;
    } else if (psswrd1.length < 8) {
      pop('Password must contain atleast 8 characters');
      return;
    } else if (psswrd2 != psswrd1 || psswrd2.isEmpty) {
      pop('Password does not match');
      return;
    } else if (phone.isEmpty || phone.length < 10) {
      pop('Enter your phone number correctly');
      return;
    } else if (name.isEmpty) {
      pop('Enter a name');
      return;
    } else if (email.isEmpty) {
      pop('Enter the email');
      return;
    } else {
      final dataQ = SignUpModelClass(
          firstName: name,
          lastName: name,
          phone: phone,
          email: email,
          password: psswrd2,
          confirmPassword: psswrd1);
      isLoading = true;
      notifyListeners();
      ResponseSignUpModel? response = await APISignUp().signUpUser(dataQ);
      if (response != null) {
        _hideLoading();

        if (response.email != null) {
          Routes.push(
              screen: ScreenOtp(
            response: response,
          ));
        } else {
          pop(response.message.toString());
        }
      } else {
        pop('No network');
      }
    }
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    signUpPhoneNumControler.dispose();
    signUpnameController.dispose();
    signUpEmailController.dispose();
    signUppasswrdController.dispose();
    signUpConfrmController.dispose();
    super.dispose();
  }
}
