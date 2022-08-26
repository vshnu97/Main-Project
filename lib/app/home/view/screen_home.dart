import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

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
            Text(
              'Discover Now',
              style: dmSans(),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
              const HomeContainerWid(
                description: 'Get the best worker\nfrom your neighbourhood.',
                image: 'assests/needEmploye.png',
                title: 'Need a Worker ?',
                color: kBlueHomeColor,
              ),
              const HomeContainerWid(
                description: 'Get the job from your\nneighbourhood itself.',
                image: 'assests/kkk.png',
                title: 'Looking for rent ?',
                color: kPinkHomeColor,
              ),
              const HomeContainerWid(
                description: 'Get the job from your\nneighbourhood itself.',
                image: 'assests/lend.png',
                title: 'Lend your tools ?',
                color: kGreenHomeColor,
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
  const HomeContainerWid(
      {Key? key,
      required this.description,
      required this.image,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: heightX*.175,
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
                Container(
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
                )
              ],
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(image),
              backgroundColor: color,
            )
          ],
        ),
      ),
    );
  }
}
