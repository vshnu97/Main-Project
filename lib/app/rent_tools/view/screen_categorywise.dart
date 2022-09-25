import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view_model/rent_all_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenRentAllCategoryWise extends StatelessWidget {
  final String categoryName;
  const ScreenRentAllCategoryWise({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffe8e9ec),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffe8e9ec),
        leading: InkWell(
          onTap: () {
            Routes.popscreen();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          categoryName,
          style: viga(fcolor: kGreenColor, flettrspc: 2, fsize: 18),
        ),
      ),
      body: Consumer<RentAllProvider>(
        builder: (context, value, child) {
          return value.mechToolsList.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.mechToolsList.length,
                    itemBuilder: (context, index) {
                      final list = value.mechToolsList[index];
                      return Container(
                        height: heightX * .17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kWhiteColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kBlueColor),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    list.title.toString().toUpperCase(),
                                    style: dmSans(
                                        fcolor: kBlackColor,
                                        fsize: 18,
                                        fweight: FontWeight.w700),
                                  ),
                                  Text(
                                    'data',
                                    style: redRose(
                                        fcolor: const Color(0xff4f9788)),
                                  ),
                                  Text('data',
                                      style: dmSans(
                                          fcolor: const Color(0xffecae77),
                                          fsize: 17,
                                          fweight: FontWeight.w900)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        // BoxShadow(
                                        //   color: list.available!
                                        //       ? kAvailableGreen
                                        //       : kAvailableRed,
                                        //   blurRadius: 4.0,
                                        //   spreadRadius: 1.5,
                                        // ),
                                      ],
                                      // color: list.available!
                                      //     ? kAvailableGreen
                                      //     : kAvailableRed,
                                      // borderRadius: BorderRadius.circular(12)
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xff419b95)),
                                      child: Center(
                                        child: Text(
                                          'View & Take',
                                          style: dmSans(
                                              fcolor: kWhiteColor,
                                              fsize: 14,
                                              fweight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return kheight;
                    },
                  ),
                )
              : const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
