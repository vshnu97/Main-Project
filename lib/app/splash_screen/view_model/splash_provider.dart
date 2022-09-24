import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/routes/routes.dart';

class SplashProvider extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  String? data = '';
  SplashProvider() {
    print('splash');
    storage.read(key: "login").then((value) {
      data = value;
      log(value.toString());
    });
    check();
  }
  check() {
    print('splash');
    Timer(const Duration(seconds: 2), () {
      if (data == "true") {
        Routes.pushreplace(screen:  const ScreenHome());
      } else {
        Routes.pushreplace(screen: const ScreenLogin());
      }
    });
    notifyListeners();
  }
}
