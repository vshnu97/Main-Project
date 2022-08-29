import 'package:flutter/material.dart';
import 'package:main_project/app/hire_employee/view/employe_list.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenHireEmployee extends StatelessWidget {
  const ScreenHireEmployee({Key? key}) : super(key: key);

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
                const Positioned(
                    left: 10,
                    top: 10,
                    child: Icon(Icons.arrow_back_ios, color: kWhiteColor)),
                Positioned(
                  top: 105,
                  left: 50,
                  right: 50,
                  child: Container(
                    height: 130,
                    width: 280,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4BB50),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight70,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                    ),
                    kheight15,
                    ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          childAspectRatio: .92,
                          crossAxisSpacing: 22,
                          children: List<Widget>.generate(6, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kGreyColor),
                            );
                          })),
                    ),
                  ],
                ),
                kheight30,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                    ),
                    kheight15,
                    LimitedBox(
                      maxHeight: 200,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: GestureDetector(
                                onTap: (){
                                  RoutesScreen().pushScreen(context, const ScreenEmployeeList());
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
