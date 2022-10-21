import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class HiredWokerHistoryWidget extends StatelessWidget {
  final String category,
      name,
      number,
      valid,
      payment,
      createdDate,
      location,
      subphone,
      rate,
      month;
  final Color containerColor;

  const HiredWokerHistoryWidget(
      {Key? key,
      required this.category,
      required this.name,
      required this.number,
      required this.valid,
      required this.subphone,
      required this.createdDate,
      required this.month,
      required this.rate,
      required this.location,
      required this.containerColor,
      required this.payment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * .13,
            height: size.height * .3,
            child: Column(
              children: [
                kheight,
                Text(
                  month,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor.withOpacity(.6)),
                ),
                Text(
                  createdDate,
                  style: const TextStyle(
                      fontSize: 25,
                      color: kGreenColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                )
              ],
            ),
          ),
          SizedBox(
              width: size.width - 70,
              height: size.height * .3,
              child: Container(
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextStyleWidget(
                            text: 'category',
                            details: category,
                          ),
                          TextStyleWidget(
                            text: 'location',
                            details: location,
                          ),
                          TextStyleBookedpersonWidget(
                            text: 'worker details',
                            name: name,
                            phone: number,
                            subphone: subphone,
                          ),
                          TextStyleWidget(
                            text: 'rate /day',
                            details: rate,
                          ),
                          TextStyleWidget(
                            text: 'worker available till',
                            details: valid,
                          ),
                          TextStyleWidget(
                            text: 'Your hire payment',
                            details: payment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class TextStyleWidget extends StatelessWidget {
  final String? text;
  final String? details;

  const TextStyleWidget({
    Key? key,
    this.text,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$text :".toUpperCase(),
            style: dmSans(
                fcolor: kGreenColor, fsize: 15, fweight: FontWeight.w700)),
        kwidth,
        Text(
          details!,
          style: dmSans(
              fcolor: kGreenColor.withOpacity(.4),
              fsize: 15,
              fweight: FontWeight.w700),
        )
      ],
    );
  }
}

class TextStyleBookedpersonWidget extends StatelessWidget {
  final String text, name, phone, subphone;

  const TextStyleBookedpersonWidget({
    Key? key,
    required this.text,
    required this.name,
    required this.phone,
    required this.subphone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text :".toUpperCase(),
            style: dmSans(
                fcolor: kGreenColor, fsize: 15, fweight: FontWeight.w700)),
        kwidth,
        Column(
          children: [
            Text(
              name,
              style: dmSans(
                  fcolor: kGreenColor.withOpacity(.4),
                  fsize: 15,
                  fweight: FontWeight.w700),
            ),
            Text(
              phone,
              style: dmSans(
                  fcolor: kGreenColor.withOpacity(.4),
                  fsize: 15,
                  fweight: FontWeight.w700),
            ),
            Text(
              subphone,
              style: dmSans(
                  fcolor: kGreenColor.withOpacity(.4),
                  fsize: 15,
                  fweight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
