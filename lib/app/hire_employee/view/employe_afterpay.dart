import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenEmployePaymentProfile extends StatelessWidget {
  const ScreenEmployePaymentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(205),
        child: Container(
          height: 205,
          decoration: const BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Spacer(),
                    Icon(Icons.home, color: kWhiteColor)
                  ],
                ),
                kheight15,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kWhiteColor),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.star,
                                color: kyellowColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rating',
                                style: poppins(
                                    fsize: 14,
                                    fweight: FontWeight.w600,
                                    fcolor: kWhiteColor),
                              ),
                            ],
                          ),
                          kheight5,
                          Text(
                            'Name',
                            style: dmSans(fcolor: kWhiteColor, fsize: 21),
                          ),
                          kheight5,
                          Text(
                            'Profession',
                            style: redRose(
                              fsize: 16,
                              fcolor: const Color(0xffA3C4CC),
                              fweight: FontWeight.normal,
                            ),
                          ),
                          kheight5,
                          Text('Price',
                              style: dmSans(
                                  fcolor: kWhiteColor,
                                  fsize: 22,
                                  fweight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Services',
                  style: roboto(),
                ),
                kheight20,
                LimitedBox(
                  maxHeight: 135,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Container(
                            height: 135,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffE8F4F2)),
                          ),
                        );
                      })),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: roboto(),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location details',
                        style: dmMono(fsize: 19),
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: kGreyColor.withOpacity(.4),
                        size: 35,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: kBlackColor.withOpacity(.3),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DateTimeWidget(
                    icon: Icons.calendar_month,
                    title: 'Date',
                    content: '0/00/0000'),
                DateTimeWidget(
                    icon: Icons.timer, title: 'Time', content: '0:00')
              ],
            ),
            Column(
              children: [
                Text(
                  'Contact Number',
                  style: dmSans(
                      fsize: 20, fcolor: kGreenColor, fweight: FontWeight.bold),
                ),
                kheight5,
                Text('+91 XXXXXXXXX',
                    style: dmSans(
                        fsize: 18,
                        fcolor: Colors.red,
                        fweight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: kGreenColor,
        child: Center(
          child:
              Text('Booked', style: dmSans(fcolor: kWhiteColor, flettrspc: 2)),
        ),
      ),
    ));
  }
}

class DateTimeWidget extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  const DateTimeWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: roboto(),
        ),
        kheight15,
        Container(
          height: 40,
          width: 160,
          color: const Color(0xffE8F4F2),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  content,
                  style: roboto(fsize: 18, fcolor: kBlackColor),
                ),
                Icon(icon)
              ],
            ),
          ),
        )
      ],
    );
  }
}
