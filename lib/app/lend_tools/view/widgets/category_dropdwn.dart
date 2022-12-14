import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          " Category *",
          style:
              dmSans(fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
        ),
        Consumer<LendProvider>(
          builder: (context, provider, child) => DropdownButton(
            style: viga(
                fweight: FontWeight.w500, fcolor: kGreenColor.withOpacity(.5)),
            hint: const Text(
              'Select Category',
              style:
                  TextStyle(overflow: TextOverflow.ellipsis, color: kGreyColor),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: kGreenColor,
            ),
            value:provider. dropdownvalue,
            items: provider.categories.map((countryname) {
              return DropdownMenuItem(
                value: countryname,
                child: Text(countryname),
              );
            }).toList(),
            onChanged: (String? value) {
              provider.changeDropName(value);
            },
          ),
        ),
      ],
    );
  }
}
