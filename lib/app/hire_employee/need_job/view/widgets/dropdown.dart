import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class DropdownWidget extends StatelessWidget {
  String title;
  DropdownWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              dmSans(fcolor: kGreenColor, fsize: 20, fweight: FontWeight.w700),
        ),
        DropdownButton(
          hint: const Text(
            'Select Category',
            style:
                TextStyle(overflow: TextOverflow.ellipsis, color: kGreyColor),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: kGreenColor,
          ),
          items: <String>[
            'A',
            'B',
            'C',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}