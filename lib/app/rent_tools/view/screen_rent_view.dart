import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/view_model/rent_item_view_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';

class ScreenRentItemView extends StatelessWidget {
  final Result list;
  const ScreenRentItemView({Key? key, required this.list}) : super(key: key);
  List<Image> imglist() {
    return [
      Image.network(list.image.toString()),
      Image.network(list.image1.toString()),
      Image.network(list.image2.toString()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Consumer<RentItemViewProvider>(
            builder: (context, value, child) => CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 2700),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  value.carouselSlider(index);
                },
              ),
              items: imglist().map((card) {
                return Builder(builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    child: card,
                  );
                });
              }).toList(),
            ),
            
          
            
          ),
        ],
      ),
    );
  }
}
