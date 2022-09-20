import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/providers/providers.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';

void main(List<String> args) {
  runApp(Providers.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Routes.navigatorKey,
        scaffoldMessengerKey: Providers.rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kWhiteColor,
        ),
        home:const ScreenLogin());
  }

  // check() {
  //     String? data = '';
  //   const storage = FlutterSecureStorage();
  //   storage.read(key: 'Login').then((value) {
  //     data = value;
      
  //     if (data == "true") {
  //        Routes.push(screen:const ScreenHome() ) ;
  //       } else {
  //          Routes.push(screen:const ScreenLogin() ) ;
  //       }
  //   });
  // }
}
