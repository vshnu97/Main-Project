import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_project/app/signup/model/otp_model.dart';

class OtpProv extends ChangeNotifier {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  final otp5 = TextEditingController();
  final otp6 = TextEditingController();

  final url = 'http://10.0.2.2:8000/user/verify/';
  otdDataBse() async {
    final otp = {
      otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text
    };
    final codeQ = otp.join().toString();

    final dataQ = OtpModelClass(code: codeQ, phone: '8891566472');

    Response response = await Dio().post(url, data: dataQ.toJson());
    log(response.data.toString());
  }
}
