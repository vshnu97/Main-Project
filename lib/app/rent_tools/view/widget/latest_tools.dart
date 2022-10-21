import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view/screen_rent_view.dart';
import 'package:main_project/app/rent_tools/view_model/rent_all_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

import '../../../need_worker/view/widget/shimmer_widget.dart';

class PopularToolsListWidget extends StatelessWidget {
  const PopularToolsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<RentAllProvider>(builder: (context, value, child) {
      return value.allRentItems.isEmpty
          ? SizedBox(height: size.height * .5, child: buildMovieShimmer())
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.allRentItems.length,
              itemBuilder: (context, index) {
                final list = value.allRentItems[index];
                return Container(
                  height: size.height * .17,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kWhiteColor),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * .13,
                          width: size.width * .26,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(list.image.toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .04,
                        ),
                        SizedBox(
                          width: size.width * .31,
                          child: Column(
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
                                list.category!.name.toString(),
                                style: dmSans(
                                    fcolor: kGreyColor,
                                    fsize: 16,
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
                              onTap: () {
                                Routes.push(
                                    screen: ScreenRentItemView(list: list));
                              },
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
            );
    });
  }

  Widget buildMovieShimmer() => ListView.separated(
      itemBuilder: ((context, index) {
        return ListTile(
          leading: const CustomWidget.rectangular(height: 120, width: 80),
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomWidget.rectangular(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          subtitle: const CustomWidget.rectangular(height: 14),
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 5,
        );
      }),
      itemCount: 10);
}
