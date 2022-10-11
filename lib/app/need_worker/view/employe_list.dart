import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/employe_profile.dart';
import 'package:main_project/app/need_worker/view/widget/shimmer_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';
import '../view_model/need_worker_provider.dart';

class ScreenEmployeeList extends StatelessWidget {
  final String name;
  const ScreenEmployeeList({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<NeedWorkerProvider>();
    return Scaffold(
      backgroundColor: kscaffoldcolor,
      appBar: AppBar(
          backgroundColor: kscaffoldcolor,
          centerTitle: true,
          title: Text(
            name,
            style: poppins(fcolor: kBlackColor, fsize: 16),
          ),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Routes.popscreen();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          )),
      body: Consumer<NeedWorkerProvider>(
          builder: (BuildContext context, NeedWorkerProvider value, _) {
        return value.sortedData.isEmpty
            ? buildMovieShimmer()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      value.sortedData.reversed;
                      final item = value.sortedData[index];
                      return Container(
                        height: size.height * .17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kWhiteColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: size.height * .14,
                                width: size.width * .27,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(context
                                          .read<NeedJobPostProvider>()
                                          .categoryImage(item.category!.name))),
                                  color: kGreyColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    item.title.toString().toUpperCase(),
                                    style: dmSans(
                                        fcolor: kBlackColor,
                                        fsize: 18,
                                        fweight: FontWeight.w700),
                                  ),
                                  Text(
                                    item.district!.district.toString(),
                                    style: redRose(
                                        fcolor: const Color(0xff4f9788)),
                                  ),
                                  Text("₹ ${item.rate.toString()}.00",
                                      style: dmSans(
                                          fcolor: const Color(0xffecae77),
                                          fsize: 17,
                                          fweight: FontWeight.w900)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: item.available!
                                                ? kAvailableGreen
                                                : kAvailableRed,
                                            blurRadius: 4.0,
                                            spreadRadius: 1.5,
                                          ),
                                        ],
                                        color: item.available!
                                            ? kAvailableGreen
                                            : kAvailableRed,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Routes.push(
                                          screen: ScreenEmployeProfile(
                                        item: item,
                                      ));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                    }),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    }),
                    itemCount: provider.sortedData.length),
              );
      }),
    );
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
      itemCount: 15);
}
