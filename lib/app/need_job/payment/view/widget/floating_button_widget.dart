import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class FloatingButtonWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  const FloatingButtonWidget({
    Key? key,
    required this.onClick,
    required this.title,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onClick,
          child: Container(
            height: size.height * .06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: kGreenColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kwidth,
                Text(
                  title,
                  style: poppins(fsize: 16, fcolor: kWhiteColor),
                ),
                Image.asset(
                  'assests/arrwG.png',
                ),
                kwidth
              ],
            ),
          ),
        )
      ],
    );
  }
}
