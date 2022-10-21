import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ColorContainerWidget extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback funtion;
  final Color boxtColor;

  const ColorContainerWidget(
      {Key? key,
      required this.color,
      required this.funtion,
      required this.boxtColor,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: funtion,
      child: Container(
        height: size.height * .13,
        width: size.width * .32,
        decoration: BoxDecoration(
           boxShadow:  const [
          BoxShadow(color: kGreyColor, blurRadius: 5, offset: Offset(0, 7))
        ],
            color: boxtColor, borderRadius: BorderRadius.circular(17)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: poppins(
                      fcolor: color,
                      fsize: 14,
                      flettrspc: 0,
                      fweight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                 Text('...',style: dmSans(fcolor: kGreenColor),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
