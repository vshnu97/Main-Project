import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class WorkerProfilePageWidget extends StatelessWidget {
  final String profession,
      description,
      address,
      city,
      district,
      date,
      rate,
      image;

  const WorkerProfilePageWidget({
    Key? key,
    required this.address,
    required this.profession,
    required this.city,
    required this.date,
    required this.description,
    required this.district,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * .7,
      child: Stack(
        children: [
          Positioned(
            top: size.height * .16,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: kGreyColor,
                        blurRadius: 15,
                        offset: Offset(0, 10))
                  ],
                  color: kWhiteColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight40,
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
                            profession,
                            style: redRose(fsize: 18, fcolor: kGreenColor),
                          )
                        ],
                      ),
                      Text("₹ $rate.00 /day",
                          style: dmSans(
                              fcolor: kGreenColor,
                              fsize: 17,
                              fweight: FontWeight.w900)),
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
                            description,
                            style: poppins(
                                fsize: 14,
                                fweight: FontWeight.w600,
                                flettrspc: .5,
                                fcolor: kGreenColor),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: dmSans(
                              fsize: 17,
                              fcolor: kGreyColor,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$city | $district",
                                style: dmMono(
                                    fsize: 18,
                                    fweight: FontWeight.w700,
                                    fcolor: kGreenColor),
                              ),
                              Image.asset('assests/location.png')
                            ],
                          ),
                          kheight5,
                          Text(
                            "$address ",
                            style: dmMono(
                                flettrspc: 0,
                                fcolor: kGreenColor.withOpacity(.8)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available till',
                            style: dmSans(
                              fsize: 17,
                              fcolor: kGreyColor,
                            ),
                          ),
                          kheight5,
                          Text(
                            date,
                            style: poppins(
                                fsize: 14,
                                fweight: FontWeight.w600,
                                flettrspc: .5,
                                fcolor: kGreenColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: size.width * .1,
            right: size.width * .1,
            child: Center(
              child: CircleAvatar(
                radius: size.height * .12,
                backgroundImage: AssetImage(image),
              ),
            ),
          )
        ],
      ),
    );
  }
}
