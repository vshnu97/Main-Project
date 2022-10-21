import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class JobPostDropdownDistrictCity extends StatelessWidget {
  const JobPostDropdownDistrictCity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: size.height * .1, maxWidth: size.width * .4),
          child: Column(
            children: [
              Text(
                " District *",
                style: dmSans(
                    fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
              ),
              Consumer<NeedJobPostProvider>(
                builder: (context, provider, child) => DropdownButtonFormField(
                  style: viga(
                      fweight: FontWeight.w500,
                      fcolor: kGreenColor.withOpacity(.5)),
                  hint: const Text(
                    'Select District',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kGreyColor,
                        fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kGreenColor,
                  ),
                  items: provider.districtList.map((districtsname) {
                    return DropdownMenuItem<String>(
                      value: districtsname.id.toString(),
                      child: Text(districtsname.district.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    provider.districtId = int.tryParse(value!);
                    provider.getCity(value);
                  },
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: size.height * .1, maxWidth: size.width * .4),
          child: Column(
            children: [
              Text(
                " City *",
                style: dmSans(
                    fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700),
              ),
              Consumer<NeedJobPostProvider>(
                builder: (context, provider, child) => DropdownButtonFormField(
                  style: viga(
                      fweight: FontWeight.w500,
                      fcolor: kGreenColor.withOpacity(.5)),
                  hint: const Text(
                    'Select a city',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kGreyColor,
                        fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kGreenColor,
                  ),
                  items: provider.citytList.map((districtsname) {
                    return DropdownMenuItem<String>(
                      value: districtsname.id.toString(),
                      child: Text(districtsname.city.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    provider.cityID = int.tryParse(value!);

                    log(provider.cityID.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
