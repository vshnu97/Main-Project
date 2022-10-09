import 'package:flutter/material.dart';
import 'package:main_project/app/need_worker/view/employe_list.dart';
import 'package:main_project/app/need_worker/view/widget/sliverapp_bar.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenHireEmployee extends StatelessWidget {
  const ScreenHireEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(170),
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       children: [
        //         Container(
        //           height: 170,
        //           decoration: const BoxDecoration(
        //               color: kGreenColor,
        //               borderRadius: BorderRadius.only(
        //                   bottomLeft: Radius.circular(25),
        //                   bottomRight: Radius.circular(25))),
        //         ),
        //         Positioned(
        //             left: 10,
        //             top: 10,
        //             child: InkWell(
        //                 onTap: () {
        //                   Routes.popscreen();
        //                 },
        //                 child: const Icon(Icons.arrow_back_ios,
        //                     color: kWhiteColor))),
        //         Positioned(
        //           top: 105,
        //           left: 50,
        //           right: 50,
        //           child: Container(
        //             height: 130,
        //             width: 280,
        //             decoration: BoxDecoration(
        //                 color: const Color(0xffE4BB50),
        //                 borderRadius: BorderRadius.circular(15)),
        //           ),
        //         )
        //       ],
        //     )),
        body: CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverDelegate(
              expandedHeight: 120,
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select by category',
                                style: roboto(
                                  fsize: 18,
                                  fweight: FontWeight.w700,
                                  fcolor: kGreenColor,
                                )),
                          ],
                        ),
                        kheight15,
                        ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              childAspectRatio:1,
                              crossAxisSpacing: 15,
                              children: List<Widget>.generate(13, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Routes.push(
                                        screen: const ScreenEmployeeList());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kGreyColor),
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight15,
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select by category',
                                style: roboto(
                                  fsize: 18,
                                  fweight: FontWeight.w700,
                                  fcolor: kGreenColor,
                                )),
                          ],
                        ),
                        kheight15,
                        LimitedBox(
                          maxHeight: 200,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Routes.push(
                                          screen: const ScreenEmployeeList());
                                    },
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: kGreyColor),
                                    ),
                                  ),
                                );
                              })),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
