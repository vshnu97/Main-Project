import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';

class DividerWid extends StatelessWidget {
  const DividerWid({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (size / 2.4),
          child: const Divider(),
        ),
        Text(
          "Or",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: kGreyColor.withOpacity(.6)),
        ),
        SizedBox(
          width: (size / 2.4),
          child: const Divider(),
        ),
      ],
    );
  }
}