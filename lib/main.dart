import 'package:flutter/material.dart';
import 'package:main_project/app/login/login.dart';
import 'package:main_project/app/utities/colors/colors.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteColor,
      ),
      home: const ScreenLogin(),
    );
  }
}
