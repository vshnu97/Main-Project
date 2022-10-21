
import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class DropdownDistrictCity extends StatelessWidget {
  const DropdownDistrictCity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              " District *",
              style: dmSans(
                  fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
            ),
            Consumer<NeedJobPostProvider>(
              builder: (context, provider, child) {
             
                return DropdownButton(
                style: viga(
                    fweight: FontWeight.w500,
                    fcolor: kGreenColor.withOpacity(.5)),
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
                value: provider.dropdownvalue,
                items: provider.districtList.map((districtsname) {
                  return DropdownMenuItem(
                    value: districtsname.district.toString(),
                    child: Text(districtsname.district.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                 // log(provider.districtList.indexOf(newValue));
                  provider.changeDropName(newValue);
                },
              );}
            ),
          ],
        ),
        Column(
          children: [
            Text(
              " City *",
              style: dmSans(
                  fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
            ),
            // Consumer<LendProvider>(
            //   builder: (context, object, child) => DropdownButton(
            //       style: viga(
            //           fweight: FontWeight.w500,
            //           fcolor: kGreenColor.withOpacity(.5)),
            //       hint: const Text(
            //         'Select city',
            //         style: TextStyle(
            //             overflow: TextOverflow.ellipsis,
            //             color: kGreyColor,
            //             fontSize: 14),
            //       ),
            //       disabledHint: const Text('Select a district first',
            //           style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               color: kGreyColor,
            //               fontSize: 14)),
            //       icon: const Icon(
            //         Icons.keyboard_arrow_down,
            //         color: kGreenColor,
            //       ),
            //       value: 
            //       items: 
            //       onChanged: object.disableDropdown
            //           ? null
            //           : (value) => object.secondChanged(value)),
            // ),
          ],
        ),
      ],
    );
  }
}
