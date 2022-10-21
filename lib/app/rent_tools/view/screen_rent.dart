import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view/widget/appbar_widget.dart';
import 'package:main_project/app/rent_tools/view/widget/latest_tools.dart';
import 'package:main_project/app/rent_tools/view/widget/tools_category.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenRentTools extends StatelessWidget {
  const ScreenRentTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(heightX * .22),
            child: AppbarWidgetRentTools(heightX: heightX)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select by category',
                      style: roboto(
                        fsize: 18,
                        fweight: FontWeight.w700,
                        flettrspc: 0,
                        fcolor: kBlackColor,
                      )),
                  kheight,
                  const ToolsCategoryListWidget()
                ],
              ),
              kheight15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest tools',
                    style: roboto(
                      fcolor: kBlackColor,
                      fweight: FontWeight.w700,
                      flettrspc: 0,
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
