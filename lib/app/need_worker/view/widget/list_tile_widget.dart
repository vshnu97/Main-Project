import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ListTileWidget extends StatelessWidget {
  final String image;
  final String title;
  final String district;
  final String rate;
  VoidCallback onclick;
  Color color;
  Color shdow;

  ListTileWidget(
      {Key? key,
      required this.district,
      required this.image,
      required this.onclick,
      required this.rate,
      required this.color,
      required this.shdow,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .17,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: kWhiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * .14,
              width: size.width * .27,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                color: kGreyColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: dmSans(
                      fcolor: kBlackColor, fsize: 18, fweight: FontWeight.w700),
                ),
                Text(
                  district,
                  style: redRose(fcolor: const Color(0xff4f9788)),
                ),
                Text(rate,
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
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: color,
                      blurRadius: 4.0,
                      spreadRadius: 1.5,
                    ),
                  ], color: shdow, borderRadius: BorderRadius.circular(12)),
                ),
                InkWell(
                  onTap: onclick,
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
  }
}
