import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view/widget/popular_tools.dart';
import 'package:main_project/app/rent_tools/view/widget/tools_category.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenRentTools extends StatelessWidget {
  const ScreenRentTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(170),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 170,
                  decoration: const BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                ),
                Positioned(
                    left: 10,
                    top: 10,
                    child: InkWell(
                        onTap: () {
                          Routes.popscreen();
                        },
                        child: const Icon(Icons.arrow_back_ios,
                            color: kWhiteColor))),
                Positioned(
                  bottom: 30,
                  left: 35,
                  right: 35,
                  child: SizedBox(
                      child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search,
                          color: kWhiteColor, size: 30),
                      labelText: 'Search',
                      labelStyle: roboto(
                          fweight: FontWeight.w400,
                          fcolor: kWhiteColor.withOpacity(.5)),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: kWhiteColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kGreyColor)),
                    ),
                  )),
                ),
                Positioned(
                    left: 35,
                    top: 35,
                    child: Text(
                      'What are you\nlooking for?',
                      style: dmSans(
                          fcolor: kWhiteColor,
                          fsize: 20,
                          fweight: FontWeight.w600,
                          flettrspc: 1),
                    ))
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rent for',
                    style: roboto(fsize: 18, fweight: FontWeight.w700),
                  ),
                  kheight,
                  const ToolsCategoryListWidget()
                ],
              ),
              kheight15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular tools',
                    style: roboto(
                      fcolor: kBlackColor,
                      fweight: FontWeight.w700,
                      fsize: 18,
                    ),
                  ),
                  kheight,
                  const PopularToolsListWidget()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
