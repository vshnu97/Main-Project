import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ImageWid extends StatelessWidget {
  const ImageWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LendProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            PickImageContainerWidget1(),
            PickImageContainerWidget2(),
            PickImageContainerWidget3(),
          ],
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assests/iconsIdea.png'),
            kwidth,
            Text(
              'Add images and lend faster',
              style: poppins(
                  fcolor: kGreenColor.withOpacity(.6),
                  fsize: 17,
                  fweight: FontWeight.w600,
                  flettrspc: 0),
            ),
          ],
        )
      ],
    );
  }
}

class PickImageContainerWidget1 extends StatelessWidget {
  const PickImageContainerWidget1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LendProvider>();
    return InkWell(
      onTap: () {
        provider.pickImage1();
      },
      child: Selector<LendProvider, String>(
          selector: (BuildContext context, LendProvider value) => value.image1,
          builder: (context, String image1, child) {
            return Container(
              height: 100,
              width: 100,
              decoration: image1.trim().isEmpty
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kGreyColor.withOpacity(.3),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assests/addImage.png",
                        ),
                      ),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kGreyColor.withOpacity(.3),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image:
                            MemoryImage(const Base64Decoder().convert(image1)),
                      ),
                    ),
            );
          }),
    );
  }
}

class PickImageContainerWidget2 extends StatelessWidget {
  const PickImageContainerWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LendProvider>();
    return InkWell(
      onTap: () {
        provider.pickImage2();
      },
      child: Selector<LendProvider, String>(
        selector: (BuildContext context, LendProvider value) => value.image2,
        builder: (context, String image2, child) => Container(
          height: 100,
          width: 100,
          decoration: image2.trim().isEmpty
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kGreyColor.withOpacity(.3),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assests/addImage.png",
                    ),
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kGreyColor.withOpacity(.3),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: MemoryImage(const Base64Decoder().convert(image2)),
                  ),
                ),
        ),
      ),
    );
  }
}

class PickImageContainerWidget3 extends StatelessWidget {
  const PickImageContainerWidget3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LendProvider>();
    return InkWell(
      onTap: () {
        provider.pickImage3();
      },
      child: Selector<LendProvider, String>(
        selector: (BuildContext context, LendProvider value) => value.image3,
        builder: (context, String image3, child) => Container(
          height: 100,
          width: 100,
          decoration: image3.trim().isEmpty
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kGreyColor.withOpacity(.3),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assests/addImage.png",
                    ),
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kGreyColor.withOpacity(.3),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: MemoryImage(const Base64Decoder().convert(image3)),
                  ),
                ),
        ),
      ),
    );
  }
}
