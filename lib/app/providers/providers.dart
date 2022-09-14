import 'package:flutter/material.dart';
import 'package:main_project/app/login/view_model/login.dart';
import 'package:main_project/app/signup/view_model/otp.prov.dart';
import 'package:main_project/app/signup/view_model/signup_prov.dart';
import 'package:main_project/main.dart';
import 'package:provider/provider.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProv>(create: ((context) => HomeProv())),
        ChangeNotifierProvider<SignUpProv>(create: ((context) => SignUpProv())),
        ChangeNotifierProvider<OtpProv>(create: ((context) => OtpProv())),
      ],
      child: const MyApp(),
    );
  }
}
