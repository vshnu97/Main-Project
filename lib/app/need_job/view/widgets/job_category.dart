
import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class JobCategoryDropDown extends StatelessWidget {
  const JobCategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
     constraints:  BoxConstraints(maxHeight: size.height*.1,maxWidth:size.width*.5),
      child: Column(
        children: [
          Text(
            " Category *",
            style: dmSans(
                fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
          ),
          Consumer<NeedJobPostProvider>(
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
              items: provider.availableList.map((countryname) {
                return DropdownMenuItem<String>(
                  value: countryname.id.toString(),
                  child: Text(countryname.name.toString()),
                );
              }).toList(),
              onChanged: (String? value) {
              provider.categoryValue=int.tryParse(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
