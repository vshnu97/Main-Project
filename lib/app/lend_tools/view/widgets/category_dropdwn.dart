import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: size.height * .1, maxWidth: size.width * .45),
      child: Column(
        children: [
          Text(
            " Category *",
            style: dmSans(
                fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
          ),
          Consumer<LendProvider>(
            builder: (context, provider, child) => DropdownButtonFormField(
              style: viga(
                  fweight: FontWeight.w500,
                  fcolor: kGreenColor.withOpacity(.5)),
              hint: const Text(
                'Select Category',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis, color: kGreyColor),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: kGreenColor,
              ),
              items: provider.categoryList.map((countryname) {
                return DropdownMenuItem<String>(
                  value: countryname.id.toString(),
                  child: Text(countryname.name.toString()),
                );
              }).toList(),
              onChanged: (String? value) {
                provider.categoryValue = int.tryParse(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
