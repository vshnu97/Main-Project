import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/hire_employee/view/screen_hire_employe.dart';
import 'package:main_project/app/lend_tools/view/screen_lend.dart';
import 'package:main_project/app/need_job/view/screen_needjob.dart';
import 'package:main_project/app/rent_tools/view/screen_rent.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view/screen_user_profile.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            kheight20,
            InkWell(
              onTap: () {
              
              Routes.push(screen: const ScreenUserProfile());
              },
              child: Text(
                'Discover Now',
                style: dmSans(),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Find your On-Demand',
                    style: poppins(),
                  ),
                  Text(
                    'We provide better sevice for you with our\non-demand service app',
                    style: poppins(
                        fcolor: kGreyColor,
                        fweight: FontWeight.w500,
                        fsize: 13,
                        flettrspc: 0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              const HomeContainerWid(
                description: 'Get the job from your\nneighbourhood itself.',
                image: 'assests/needJobb.png',
                title: 'Need a Job ?',
                color: kYellowHomeColor,
                screen: ScreenNeedJob(),
              ),
              const HomeContainerWid(
                description: 'Get the best worker\nfrom your neighbourhood.',
                image: 'assests/needEmploye.png',
                title: 'Need a Worker ?',
                color: kBlueHomeColor,
                screen: ScreenHireEmployee(),
              ),
              const HomeContainerWid(
                description: 'Find high quality tools\nthat make job easier.',
                image: 'assests/kkk.png',
                title: 'Looking for rent ?',
                color: kPinkHomeColor,
                screen: ScreenRentTools(),
              ),
              const HomeContainerWid(
                description: 'Got nice tools in dust?\nLend them and earn.',
                image: 'assests/lend.png',
                title: 'Lend your tools ?',
                color: kGreenHomeColor,
                screen: ScreenLendTools(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContainerWid extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String image;
  final Widget screen;
  const HomeContainerWid(
      {Key? key,
      required this.description,
      required this.image,
      required this.title,
      required this.screen,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: heightX * .17,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 5, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: dmSans(fcolor: kBlackColor, fsize: 24),
                    ),
                    kheight5,
                    Text(
                      description,
                      style: ptMono(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Routes.push(screen: screen);
                  },
                  child: Container(
                    width: 145,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Get started',
                            style: poppins(
                                fcolor: kBlackColor,
                                fsize: 14,
                                flettrspc: 0,
                                fweight: FontWeight.w400),
                          ),
                          Image.asset(
                            'assests/arrow.png',
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            CircleAvatar(
              radius: 57,
              backgroundImage: AssetImage(image),
              backgroundColor: color,
            )
          ],
        ),
      ),
    );
  }
}
