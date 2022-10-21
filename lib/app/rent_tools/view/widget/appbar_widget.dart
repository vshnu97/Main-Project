import 'package:flutter/material.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class AppbarWidgetRentTools extends StatelessWidget {
  const AppbarWidgetRentTools({
    Key? key,
    required this.heightX,
  }) : super(key: key);

  final double heightX;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: heightX * .22,
          decoration: const BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        Positioned(
            left: 10,
            top: 10,
            child: InkWell(
                onTap: () {
                  Routes.popscreen();
                },
                child: const Icon(Icons.arrow_back_ios, color: kWhiteColor))),
        Positioned(
          bottom: 30,
          left: 35,
          right: 35,
          child: SizedBox(
              child: TextFormField(
            decoration: InputDecoration(
              suffixIcon:
                  const Icon(Icons.search, color: kWhiteColor, size: 30),
              labelText: 'Search',
              labelStyle: roboto(
                  fweight: FontWeight.w400,
                  fcolor: kWhiteColor.withOpacity(.5)),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kWhiteColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor)),
            ),
          )),
        ),
        Positioned(
            left: 35,
            top: 35,
            child: Text(
              'What are you\nlooking for?',
              style: dmSans(
                  fcolor: kWhiteColor,
                  fsize: 20,
                  fweight: FontWeight.w600,
                  flettrspc: 1),
            ))
      ],
    );
  }
}
