import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view/widgets/dropdown_widget.dart';
import 'package:main_project/app/lend_tools/view/widgets/textfield_lend.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenLendTools extends StatelessWidget {
  const ScreenLendTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build');
    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Routes.popscreen();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kGreenColor,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const ImageWid(),
            kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DropdownWidgetLend(
                  title: 'District *',
                ),
                DropdownWidgetLend(
                  title: 'City *',
                ),
              ],
            ),
            kheight,
            const DropdownWidgetLend(
              title: 'Category *',
            ),
            kheight5,
            LendTextfieldWidget(
              hinttitle: 'Name of tool you want to lend',
              title: 'Title *',
              maxlength: 20,
              widthSize: widthSize * .6,
              keyboardType: TextInputType.text,
            ),
            kheight20,
            LendTextfieldWidget(
              hinttitle: 'Short details about the tool',
              title: 'Description *',
              maxlength: 6,
              widthSize: 350,
              keyboardType: TextInputType.text,
            ),
            kheight20,
            LendTextfieldWidget(
              textPrefix: '+91 -',
              hinttitle: 'Should not be same as reg *',
              title: 'Phone number *',
              maxlength: 10,
              widthSize: widthSize * .7,
              keyboardType: TextInputType.number,
            ),
            kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LendTextfieldWidget(
                  hinttitle: 'Your locality',
                  title: 'Place *',
                  maxlength: 20,
                  widthSize: 160,
                  keyboardType: TextInputType.text,
                ),
                LendTextfieldWidget(
                  hinttitle: 'Lend rate per day',
                  title: 'Lend rate *',
                  maxlength: 6,
                  widthSize: 160,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            kheight20,
            LendTextfieldWidget(
              hinttitle: 'Your current address',
              title: 'Address *',
              widthSize: 350,
              keyboardType: TextInputType.text,
            ),
            kheight20,
          ],
        ),
      ),
    );
  }
}

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
      child: Consumer<LendProvider>(builder: (context, value, child) {
        print('image relaoded');
        return Container(
          height: 100,
          width: 100,
          decoration: value.image1.trim().isEmpty
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
                    image: MemoryImage(
                        const Base64Decoder().convert(value.image1)),
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
      child: Consumer<LendProvider>(
        builder: (context, value, child) => Container(
          height: 100,
          width: 100,
          decoration: value.image2.trim().isEmpty
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
                    image: MemoryImage(
                        const Base64Decoder().convert(value.image2)),
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
      child: Consumer<LendProvider>(
        builder: (context, value, child) => Container(
          height: 100,
          width: 100,
          decoration: value.image3.trim().isEmpty
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
                    image: MemoryImage(
                        const Base64Decoder().convert(value.image3)),
                  ),
                ),
        ),
      ),
    );
  }
}
