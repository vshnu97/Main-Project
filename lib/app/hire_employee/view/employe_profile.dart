import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenEmployeProfile extends StatelessWidget {
  const ScreenEmployeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              height: heightX * .65,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: heightX * .5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kContainerColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kheight30,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Profession',
                                  style: dmSans(
                                    fsize: 17,
                                    fcolor: kGreyColor,
                                  ),
                                ),
                                kheight5,
                                Text(
                                  'abcd',
                                  style: redRose(fsize: 18),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: dmSans(
                                    fsize: 17,
                                    fcolor: kGreyColor,
                                  ),
                                ),
                                kheight5,
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ksdgfjhb kiabk.',
                                  style: poppins(
                                      fsize: 14,
                                      fweight: FontWeight.normal,
                                      flettrspc: .5),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(Icons.location_pin),
                                Text(
                                  'Location',
                                  style: dmMono(),
                                )
                              ],
                            ),
                            Text('Price 0.00',
                                style: dmSans(
                                    fcolor: kGreenColor,
                                    fsize: 16,
                                    fweight: FontWeight.w900))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: heightX * .12,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'To get this skilled professional',
              style: poppins(fcolor: kGreenColor, fsize: 17, flettrspc: 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: heightX * .06,
                  width: heightX * .29,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kGreenColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Make Payment',
                        style: poppins(fsize: 16, fcolor: kWhiteColor),
                      ),
                      Image.asset(
                        'assests/arrwG.png',
                      )
                    ],
                  ),
                )
              ],
            ),
            kheight5
          ],
        ),
      ),
    );
  }
}
