import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view_model/rent_all_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class PopularToolsListWidget extends StatelessWidget {
  const PopularToolsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightX = MediaQuery.of(context).size.height;
    final widthX = MediaQuery.of(context).size.width;
    return Consumer<RentAllProvider>(builder: (context, value, child) {
      return value.allRentItems.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.allRentItems.length,
              itemBuilder: (context, index) {
                final list = value.allRentItems[index];

                return Container(
                  height: heightX * .17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kWhiteColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(list.image.toString())),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              list.title.toString().toUpperCase(),
                              style: dmSans(
                                  fcolor: kBlackColor,
                                  fsize: 18,
                                  fweight: FontWeight.w700),
                            ),
                            Text(
                              list.district!.district.toString(),
                              style: redRose(fcolor: const Color(0xff4f9788)),
                            ),
                            Text("₹ ${list.rate.toString()}.00",
                                style: dmSans(
                                    fcolor: const Color(0xffecae77),
                                    fsize: 17,
                                    fweight: FontWeight.w900)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: list.available!
                                          ? kAvailableGreen
                                          : kAvailableRed,
                                      blurRadius: 4.0,
                                      spreadRadius: 1.5,
                                    ),
                                  ],
                                  color: list.available!
                                      ? kAvailableGreen
                                      : kAvailableRed,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff419b95)),
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
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return kheight;
              },
            )
          : const Center(child: CupertinoActivityIndicator());
    });
  }
}
