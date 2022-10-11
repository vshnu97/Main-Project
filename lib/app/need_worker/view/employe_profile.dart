import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';
import 'package:main_project/app/need_worker/view/employe_afterpay.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenEmployeProfile extends StatelessWidget {
  final FilterOnJobCateResponseModel item;
  const ScreenEmployeProfile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = item.validAt!.toString().substring(0, 10);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kscaffoldcolor,
      appBar: AppBar(
        backgroundColor: kscaffoldcolor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Routes.popscreen();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kGreenColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * .65,
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
                                    item.title.toString().toUpperCase(),
                                    style:
                                        redRose(fsize: 18, fcolor: kGreenColor),
                                  )
                                ],
                              ),
                              Text("₹ ${item.rate.toString()}.00 /day",
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
                                    item.discriptions.toString(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${item.city!.city.toString()} | ${item.district!.district.toString()}",
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
                                    "${item.address.toString()} ",
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
                                    number,
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
                    Positioned(
                      top: 0,
                      left: 10,
                      right: 10,
                      child: Center(
                        child: CircleAvatar(
                          radius: size.height * .12,
                          backgroundImage: AssetImage(context
                              .read<NeedJobPostProvider>()
                              .categoryImage(item.category!.name)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              kheight30,
              Column(
                children: [
                  Text(
                    'To get this skilled professional',
                    style:
                        poppins(fcolor: kGreenColor, fsize: 17, flettrspc: 0),
                  ),
                  kheight5,
                  Text(
                    '*make payment and get contact\ndetails*',
                    style: poppins(
                        fsize: 12,
                        flettrspc: 1,
                        fcolor: kAvailableRed.withOpacity(.8)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
             kheight100
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Routes.push(screen: const ScreenEmployePaymentProfile());
            },
            child: Container(
              height: size.height * .06,
              width: size.width * .55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kGreenColor),
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
            ),
          )
        ],
      ),
    );
  }
}
