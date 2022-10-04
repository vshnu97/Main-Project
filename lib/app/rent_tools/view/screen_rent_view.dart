import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/payment/view_model/payment_provider.dart';
import 'package:main_project/app/rent_tools/view_model/rent_item_view_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ScreenRentItemView extends StatelessWidget {
  final Result list;
  const ScreenRentItemView({Key? key, required this.list}) : super(key: key);
  List<Image> imglist() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<RentItemViewProvider>();
    return Consumer<RazorpayProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xffe8e9ec),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffe8e9ec),
          leading: InkWell(
            onTap: () {
              Routes.popscreen();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 220,
                initialPage: 0,
                indicatorColor: kAvailableGreen,
                indicatorRadius: 4,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {},
                autoPlayInterval: 5000,
                isLoop: true,
                children: [
                  Image.network(
                    list.image.toString(),
                  ),
                  Image.network(list.image1.toString()),
                  Image.network(list.image2.toString()),
                ],
              ),
              kheight20,
              Text(
                list.category!.name.toString(),
                style: roboto(fweight: FontWeight.w800),
              ),
              kheight,
              Text(
                list.title.toString(),
                style: dmSans(
                    fcolor: kGreenColor,
                    fweight: FontWeight.w900,
                    fsize: 22,
                    flettrspc: 1),
              ),
              kheight5,
              Text(
                list.discriptions.toString().toUpperCase(),
                style: roboto(fcolor: kGreenColor.withOpacity(.6),flettrspc: 1),
              ),
              kheight,
              Row(
                children: [
                  Text("₹ ${list.rate.toString()}.00",
                      style: dmSans(
                          fcolor: const Color.fromARGB(255, 214, 120, 37),
                          flettrspc: 1,
                          fsize: 22,
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
                    list.city!.city.toString(),
                    style: dmMono(
                        fsize: 19,
                        fweight: FontWeight.w600,
                        fcolor: kGreenColor),
                  ),
                  Text(
                    "|${list.place.toString()}",
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
                list.address.toString(),
                textAlign: TextAlign.start,
                style:
                    dmMono(fcolor: kGreenColor.withOpacity(.6), flettrspc: 0),
              ),
              kheight60,
              Text(
                'Make payment and get contact\ndetails',
                style: poppins(
                    fsize: 15,
                    flettrspc: 1,
                    fcolor: kAvailableRed.withOpacity(.8)),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                context.read<UserProfileProvider>().getUserData();
               value.option(list);
               
              },
              child: Container(
                width: size.width / 1.7,
                height: size.width * .13,
                decoration: BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Make payment',
                      style: poppins(fsize: 16, fcolor: kWhiteColor),
                    ),
                    Image.asset('assests/arrwG.png')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
