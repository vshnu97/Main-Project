import 'package:flutter/material.dart';
import 'package:main_project/app/splash_screen/view_model/splash_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, value, child) => 
       Scaffold(
        backgroundColor: kGreenColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'splash screen',
                  style: dmMono(fcolor: kWhiteColor),
                ),
              )
            ]),
      ),
    );
  }
}
