import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/home/view/home-container.dart';
import 'package:main_project/app/lend_tools/view/screen_lend.dart';
import 'package:main_project/app/need_job/view/screen_needjob.dart';
import 'package:main_project/app/need_worker/view/screen_hire_employe.dart';
import 'package:main_project/app/rent_tools/view/screen_rent.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view/screen_user_profile.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: size.width * .05,
          height: size.height * .05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<UserProfileProvider>().getUserData();
                  Routes.push(screen: const ScreenUserProfile());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 22,
                  backgroundImage: AssetImage('assests/profile.png'),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            kheight20,
            Text(
              'Discover Now',
              style: dmSans(),
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
