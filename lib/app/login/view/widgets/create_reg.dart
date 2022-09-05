import 'package:flutter/material.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';

class CreateOrRegisterWid extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget screen;
  const CreateOrRegisterWid(
      {Key? key,
      required this.screen,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kBlackColor.withOpacity(.4))),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            RoutesScreen().pushScreen(context, screen);
          },
          child: Text(
            subtitle,
            style: const TextStyle(
                color: kGreenColor, fontSize: 18, fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }
}
