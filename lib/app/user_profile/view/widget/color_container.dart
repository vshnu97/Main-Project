
import 'package:flutter/material.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ColorContainerWidget extends StatelessWidget {
final  Color color;
final  String title;
final  VoidCallback funtion;
final  Color boxtColor;

  const ColorContainerWidget(
      {Key? key,
      required this.color,
      required this.funtion,
      required this.boxtColor,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: funtion,
      child: Container(
        height: 90,
        width: 110,
        decoration: BoxDecoration(
            color: boxtColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: poppins(
                  fcolor: color,
                  fsize: 14,
                  flettrspc: 0,
                  fweight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

