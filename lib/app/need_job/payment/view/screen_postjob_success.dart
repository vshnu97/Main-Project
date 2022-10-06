import 'package:flutter/material.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/need_job/model/jobpost_paid_response.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenJobPostSuccess extends StatelessWidget {
  JobPostPaidResponseModel? response;
  ScreenJobPostSuccess({Key? key, this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kWhiteColor, elevation: 0, actions: const []),
        body: ListView(
          children: [
            kheight130,
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffe8e9ec),
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kheight100,
                          Text(
                            response!.title.toString(),
                            style: roboto(
                                fweight: FontWeight.w800,
                                fsize: 18,
                                fcolor: kGreenColor),
                          ),
                          kheight,
                          Text(
                            response!.category.toString(),
                            style: redRose(fweight: FontWeight.w800, fsize: 17),
                          ),
                          kheight20,
                          Text(
                            response!.discriptions.toString(),
                            style: roboto(
                                fcolor: kGreenColor.withOpacity(.6),
                                flettrspc: 1),
                          ),
                          kheight,
                          Row(
                            children: [
                              Text("₹ ${response!.rate.toString()}.00",
                                  style: roboto(
                                      fcolor: kGreenColor,
                                      flettrspc: 1,
                                      fsize: 20,
                                      fweight: FontWeight.w900)),
                              kwidth,
                              Text('/day',
                                  style: dmSans(
                                      fcolor: kGreenColor.withOpacity(.8),
                                      flettrspc: 1,
                                      fsize: 14,
                                      fweight: FontWeight.w800)),
                            ],
                          ),
                          kheight,
                          Row(
                            children: [
                              Text(
                                response!.city!.city.toString(),
                                style: dmMono(
                                    fsize: 19,
                                    fweight: FontWeight.w600,
                                    fcolor: kGreenColor),
                              ),
                              Text(
                                "| ${response!.place}",
                                style: dmMono(
                                    fsize: 19,
                                    fweight: FontWeight.w600,
                                    fcolor: kGreenColor),
                              ),
                              kwidth70,
                              Image.asset('assests/location.png')
                            ],
                          ),
                          kheight5,
                          Text(
                            response!.address.toString().toUpperCase(),
                            textAlign: TextAlign.start,
                            style: dmMono(
                                fcolor: kGreenColor.withOpacity(.6),
                                flettrspc: 0),
                          ),
                          kheight,
                          Text(
                            "Payment completed",
                            style: roboto(
                                fweight: FontWeight.w800,
                                fsize: 16,
                                fcolor: kGreenColor),
                          ),
                          kheight30
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -130,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 100,
                       // backgroundImage: ,
                      )
                    ],
                  ),
                )
              ],
            ),
            kheight30,
            Text(
              'Your job is successfully posted ',
              style: poppins(
                  fsize: 16,
                  flettrspc: .5,
                  fcolor: kAvailableGreen.withOpacity(.9)),
              textAlign: TextAlign.center,
            ),
            Text(
              'The post is now live.',
              style: poppins(
                  fsize: 12,
                  flettrspc: .5,
                  fcolor: kGreenColor.withOpacity(.4)),
              textAlign: TextAlign.center,
            ),
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Routes.pushreplace(screen: const ScreenHome());
                  },
                  child: Container(
                    width: size.width / 1.8,
                    height: size.height * .06,
                    decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: poppins(fsize: 16, fcolor: kWhiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
 
}
