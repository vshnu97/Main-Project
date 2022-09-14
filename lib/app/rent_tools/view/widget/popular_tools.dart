import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class PopularToolsListWidget extends StatelessWidget {
  const PopularToolsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: kContainerColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
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
                      'Product company',
                      style: redRose(),
                    ),
                    Row(
                      children: [
                        Text('Price',
                            style: dmSans(
                                fcolor: kGreenColor,
                                fsize: 18,
                                fweight: FontWeight.w900)),
                        kwidth50,
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return kheight;
      },
    );
  }
}
