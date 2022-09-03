import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/login/viewmodel/login.dart';
import 'package:main_project/app/signup/viewmodel/signup_prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeProv>(create: ((context) => HomeProv())),
    ChangeNotifierProvider<SignUpProv>(create: ((context) => SignUpProv())),
  ], child: const MyApp()));
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
