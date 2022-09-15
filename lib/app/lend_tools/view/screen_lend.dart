import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view/widgets/dropdown_widget.dart';
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
    final provider = Provider.of<LendProvider>(context);
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
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PickImageContainerWidget(provider: provider),
                    PickImageContainerWidget(provider: provider),
                    PickImageContainerWidget(provider: provider),
                  ],
                ),
                kheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assests/iconsIdea.png'),
                    kwidth,
                    Text(
                      'Add images and lend faster',
                      style: poppins(
                          fcolor: kGreenColor.withOpacity(.6),
                          fsize: 18,
                          fweight: FontWeight.w600,
                          flettrspc: 0),
                    ),
                  ],
                )
              ],
            ),
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownWidgetLend(
                  title: 'District *',
                ),
                DropdownWidgetLend(
                  title: 'City *',
                ),
              ],
            ),
            kheight15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title *',
                    style: dmSans(
                        fcolor: kGreenColor,
                        fsize: 20,
                        fweight: FontWeight.w700)),
                SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name of tool you want to lend',
                        hintStyle: roboto(
                            fcolor: kGreyColor.withOpacity(.6),
                            fweight: FontWeight.w500,
                            fsize: 14),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PickImageContainerWidget extends StatelessWidget {
  const PickImageContainerWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final LendProvider provider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        provider.pickImage();
      },
      child: Consumer<LendProvider>(
          builder: (context, value, child) => Container(
                height: 100,
                width: 100,
                decoration: value.imageQ.trim().isEmpty
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
                              const Base64Decoder().convert(value.imageQ)),
                        ),
                      ),
              )),
    );
  }
}
