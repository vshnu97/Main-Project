import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/payment/view_model/payment_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../need_job/payment/view/widget/floating_button_widget.dart';

class ScreenRentItemView extends StatelessWidget {
  final RentAll list;
  const ScreenRentItemView({Key? key, required this.list}) : super(key: key);
  List<Image> imglist() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<RazorpayProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xffe8e9ec),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '* Make payment and get contact details *',
            style: poppins(
                fsize: 14,
                flettrspc: 0,
                fweight: FontWeight.w500,
                fcolor: kAvailableRed.withOpacity(.8)),
            textAlign: TextAlign.center,
          ),
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
              RentviewDetailsWidget(
                title: 'Profession',
                details: list.category!.name.toString(),
                fontSize: 17,
              ),
              kheight5,
              RentviewDetailsWidget(
                title: 'Title',
                details: list.title.toString(),
                fontSize: 20,
              ),
              kheight5,
              RentviewDetailsWidget(
                title: 'Description',
                details: list.discriptions.toString(),
                fontSize: 20,
              ),
              kheight,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: dmSans(
                      fsize: 17,
                      fcolor: kGreyColor,
                    ),
                  ),
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
                ],
              ),
              kheight,
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
            ],
          ),
        ),
        floatingActionButton: FloatingButtonWidget(
          size: size,
          onClick: () {
            context.read<UserProfileProvider>().getUserData();
            value.option(list);
          },
          title: 'Make payment',
        ),

        //
      ),
    );
  }
}

class RentviewDetailsWidget extends StatelessWidget {
  final String title, details;
  double fontSize = 17;

  RentviewDetailsWidget(
      {Key? key,
      required this.title,
      required this.details,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: dmSans(
            fsize: 17,
            fcolor: kGreyColor,
          ),
        ),
        Text(
          details,
          style: dmSans(
              fsize: fontSize, fcolor: kGreenColor, fweight: FontWeight.w800),
        )
      ],
    );
  }
}
