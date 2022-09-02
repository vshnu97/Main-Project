import 'package:flutter/material.dart';
import 'package:main_project/app/hire_employee/view/employe_profile.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ScreenEmployeeList extends StatelessWidget {
  const ScreenEmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          centerTitle: true,
          title: Text(
            'Category Name',
            style: poppins(fcolor: kBlackColor, fsize: 16),
          ),
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          )),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kContainerColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kWhiteColor),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Name',
                          style: dmSans(fcolor: kBlackColor, fsize: 17),
                        ),
                        Text(
                          'Proffession',
                          style: redRose(),
                        ),
                        Text('Price',
                            style: dmSans(
                                fcolor: kGreenColor,
                                fsize: 18,
                                fweight: FontWeight.w900)),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: kyellowColor,
                            ),
                            Text(
                              'Rating',
                              style: poppins(
                                  fsize: 15,
                                  fweight: FontWeight.w600,
                                  fcolor: kBlackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            RoutesScreen().pushScreen(context, const ScreenEmployeProfile());
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kGreenColor),
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
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 0,
          );
        }),
        itemCount: 10,
      ),
    );
  }
}
