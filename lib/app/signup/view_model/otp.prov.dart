import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/signup/model/otp_model.dart';
import 'package:main_project/app/signup/model/response_otp.dart';
import 'package:main_project/app/signup/model/response_signup.dart';
import 'package:main_project/app/signup/view_model/api%20service/api_service_otp.dart';

class OtpProv extends ChangeNotifier {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  final otp5 = TextEditingController();
  final otp6 = TextEditingController();
  bool isLoading = false;

  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  otdDataBse(ResponseSignUpModel object) async {
    final otp = {
      otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text
    };
    final codeQ = otp.join().toString();

    final dataQ = OtpModelClass(code: codeQ, phone: object.mobile.toString());
    isLoading = true;
    notifyListeners();
    ResponseOTP? response = await OtpAPI().verifyOTP(dataQ);
    log(response.toString());
    if (response != null) {
      if (response.isActive!) {
        Routes.pushreplace(screen: const ScreenLogin());
      } else {
        pop(response.message.toString());
      }
    } else {
      pop('No network');
    }
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
