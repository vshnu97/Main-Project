import 'package:flutter/material.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/model/on_payment_response.dart';
import 'package:main_project/app/need_worker/view/widget/shimmer_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenEmployePaymentProfile extends StatelessWidget {
  List<PaymentDoneResponseModel> hiredWorkerList;
  ScreenEmployePaymentProfile({Key? key, required this.hiredWorkerList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = hiredWorkerList.first.validAt.toString().substring(0, 10);
    Size size = MediaQuery.of(context).size;

    return hiredWorkerList.isEmpty
        ? Scaffold(body: buildMovieShimmer(context))
        : SafeArea(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Routes.pushremoveUntil(
                                    screen: const ScreenHome());
                              },
                              child: const Icon(Icons.home, color: kWhiteColor))
                        ],
                      ),
                      kheight15,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              height: size.height * .16,
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(context
                                          .read<NeedJobPostProvider>()
                                          .categoryImage(hiredWorkerList
                                              .first.category!.name))),
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
                                  hiredWorkerList.first.title
                                      .toString()
                                      .toString(),
                                  style: dmSans(fcolor: kWhiteColor, fsize: 21),
                                ),
                                kheight,
                                Text(
                                  hiredWorkerList.first.category!.name
                                      .toString(),
                                  style: redRose(
                                    fsize: 20,
                                    fcolor: const Color(0xffA3C4CC),
                                    fweight: FontWeight.normal,
                                  ),
                                ),
                                kheight,
                                Text(
                                    "₹ ${hiredWorkerList.first.rate.toString()}.00",
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
            body: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact details',
                            style: roboto(),
                          ),
                          kheight5,
                          Text("+91-${hiredWorkerList.first.mobile.toString()}",
                              style: dmSans(
                                  fsize: 18,
                                  fcolor: Colors.red,
                                  fweight: FontWeight.bold)),
                          Text(
                              "+91-${hiredWorkerList.first.subMobile.toString()}",
                              style: dmSans(
                                  fsize: 18,
                                  fcolor: Colors.red,
                                  fweight: FontWeight.bold))
                        ],
                      ),
                      kheight20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: roboto(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${hiredWorkerList.first.city!.city.toString()} | ${hiredWorkerList.first.district!.district.toString()}",
                                style: dmMono(fsize: 19),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: kGreyColor.withOpacity(.4),
                                size: 35,
                              )
                            ],
                          ),
                          Text(
                            "${hiredWorkerList.first.address.toString()} ",
                            textAlign: TextAlign.center,
                            style: dmMono(fsize: 19),
                          ),
                        ],
                      ),
                      kheight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateTimeWidget(
                              icon: Icons.calendar_month,
                              title: 'Available till',
                              content: number),
                        ],
                      ),
                      kheight20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booked by',
                            style: roboto(),
                          ),
                          kheight5,
                          Text(
                              hiredWorkerList.first.bookedPerson!.firstName
                                  .toString(),
                              style: dmSans(
                                  fsize: 18,
                                  fcolor: kGreenColor,
                                  fweight: FontWeight.bold)),
                          Text(
                              hiredWorkerList.first.bookedPerson!.email
                                  .toString(),
                              style: dmSans(
                                  fsize: 16,
                                  fcolor: kGreenColor,
                                  fweight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: size.height * .07,
              color: kGreenColor,
              child: InkWell(
                onTap: () {
                  Routes.pushremoveUntil(screen: const ScreenHome());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Booked',
                        style: dmSans(fcolor: kWhiteColor, flettrspc: 2)),
                    Image.asset(
                      'assests/arrwG.png',
                    )
                  ],
                ),
              ),
            ),
          ));
  }

  Widget buildMovieShimmer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomWidget.rectangular(
            height: size.height * .35, width: double.infinity),
        kheight30,
        Expanded(
          child: LimitedBox(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return ListTile(
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
                  return kheight5;
                }),
                itemCount: 6),
          ),
        )
      ],
    );
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
        kheight,
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
