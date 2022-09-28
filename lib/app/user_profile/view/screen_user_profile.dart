import 'package:flutter/material.dart';
import 'package:main_project/app/user_profile/view/widget/appbar_widget.dart';
import 'package:main_project/app/user_profile/view/widget/color_container.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenUserProfile extends StatelessWidget {
  const ScreenUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * .25),
            child: AppbarWidget(size: size)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              kheight100,
              Row(
                children: [
                  Image.asset('assests/offers.png'),
                  Text(
                    ' free offers',
                    style: dmSans(fsize: 18, fcolor: kGreenColor),
                  )
                ],
              ),
              Text(
                'Pay nothing for your first 3 work\nfrom professionals ',
                style: dmSans(fsize: 15, fcolor: kBlueColor),
                textAlign: TextAlign.center,
              ),
              kheight20,
              Text(
                'History',
                style: dmSans(
                    fcolor: kGreenColor.withOpacity(.5),
                    fsize: 18,
                    fweight: FontWeight.bold),
              ),
              kheight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorContainerWidget(
                      color: kGreenColor,
                      funtion: () {},
                      boxtColor: kYellowHomeColor,
                      title: 'Jobs you added'),
                  kwidth70,
                  ColorContainerWidget(
                      color: kGreenColor,
                      funtion: () {},
                      boxtColor: kBlueHomeColor,
                      title: 'Employes you booked'),
                ],
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorContainerWidget(
                      color: kGreenColor,
                      funtion: () {},
                      boxtColor: kPinkHomeColor,
                      title: 'Tools you taken for rent'),
                  kwidth70,
                  ColorContainerWidget(
                      color: kGreenColor,
                      funtion: () {},
                      boxtColor: kGreenHomeColor,
                      title: 'Tools you given for lend'),
                ],
              ),
              kheight60,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * .15,
                    height: size.height * .007,
                    decoration: const BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
