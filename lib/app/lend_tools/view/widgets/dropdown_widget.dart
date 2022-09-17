import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class DropdownWidgetLend extends StatelessWidget {
  final String title;
  const DropdownWidgetLend({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              dmSans(fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
        ),
        Consumer<LendProvider>(
          builder: (context, valueProvider, child) => DropdownButton(
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
            onChanged: (String? value) {
              valueProvider.dropdownValueChange(value);
            },
          ),
        ),
      ],
    );
  }
}
