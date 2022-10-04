import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class DropdownDistrictCity extends StatelessWidget {
  const DropdownDistrictCity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          " District *",
          style:
              dmSans(fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
        ),
        Consumer<LendProvider>(
          builder: (context, provider, child) => DropdownButton(
            style: viga(
                fweight: FontWeight.w500, fcolor: kGreenColor.withOpacity(.5)),
            hint: const Text(
              'Select Category',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: kGreyColor,
                  fontSize: 14),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: kGreenColor,
            ),
            value: provider.districtDropdown,
            items: provider.districts.map((districtsname) {
              return DropdownMenuItem(
                value: districtsname,
                child: Text(districtsname),
              );
            }).toList(),
            onChanged: (value) {
              provider.changeDistrict(value);
            },
          ),
        ),
        Column(
          children: [
            Text(
              " City *",
              style: dmSans(
                  fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
            ),
            Consumer<LendProvider>(
              builder: (context, object, child) => DropdownButton(
                  style: viga(
                      fweight: FontWeight.w500,
                      fcolor: kGreenColor.withOpacity(.5)),
                  hint: const Text(
                    'Select city',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kGreyColor,
                        fontSize: 14),
                  ),
                  disabledHint: const Text('Select a district first'),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kGreenColor,
                  ),
                  value: object.districtDropdown,
                  items: object.menuItems,
                  onChanged: object.disableDropdown
                      ? null
                      : (value) => object.secondChanged(value)),
            ),
          ],
        ),
      ],
    );
  }
}
