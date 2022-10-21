import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kGreenColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assests/processing.json',
                  height: MediaQuery.of(context).size.height * .2),
              Text(
                'Payment processing...',
                style: dmSans(fcolor: kWhiteColor, fsize: 18),
              )
            ],
          ),
        ));
  }
}
