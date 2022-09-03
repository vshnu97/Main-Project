import 'package:flutter/material.dart';

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
}
