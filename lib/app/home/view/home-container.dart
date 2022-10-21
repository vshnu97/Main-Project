import 'package:flutter/material.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class HomeContainerWid extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String image;
  final Widget screen;
  const HomeContainerWid(
      {Key? key,
      required this.description,
      required this.image,
      required this.title,
      required this.screen,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: size.height * .17,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: kGreyColor, blurRadius: 5, offset: Offset(0, 7))
        ],
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 5, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: dmSans(fcolor: kBlackColor, fsize: 24),
                    ),
                    kheight5,
                    Text(
                      description,
                      style: ptMono(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Routes.push(screen: screen);
                  },
                  child: Container(
                    width: size.width * .35,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: kGreyColor,
                              blurRadius: 10,
                              offset: Offset(5, 5))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: kWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Get started',
                            style: poppins(
                                fcolor: kBlackColor,
                                fsize: 14,
                                flettrspc: 0,
                                fweight: FontWeight.w400),
                          ),
                          Image.asset(
                            'assests/arrow.png',
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            CircleAvatar(
              radius: size.height * .07,
              backgroundImage: AssetImage(image),
              backgroundColor: color,
            )
          ],
        ),
      ),
    );
  }
}
