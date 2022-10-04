import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view/widgets/category_dropdwn.dart';
import 'package:main_project/app/lend_tools/view/widgets/district_city_dropdown.dart';
import 'package:main_project/app/lend_tools/view/widgets/pick_image.dart';
import 'package:main_project/app/lend_tools/view/widgets/textfield_lend.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ScreenLendTools extends StatelessWidget {
  const ScreenLendTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<LendProvider>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "*You need to pay ₹50 to make a post*",
            style: gFontsOleo(cl: kAvailableRed),
          ),
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
            const DropdownDistrictCity(),
            kheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.datePicker(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Date *',
                          style: dmSans(
                              fcolor: kGreenColor,
                              fsize: 18,
                              fweight: FontWeight.w700)),
                      Text(
                        '(lend availability till ?)',
                        textAlign: TextAlign.center,
                        style: dmSans(
                            fcolor: kGreenColor,
                            fsize: 12,
                            fweight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              provider.datePicker(context);
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              size: 28,
                              color: kyellowColor,
                            ),
                          ),
                          Consumer<LendProvider>(
                            builder: (context, obj, _) => Text(
                                DateFormat('yMd').format(obj.dateNow),
                                style: viga(
                                    fsize: 12,
                                    fweight: FontWeight.w600,
                                    flettrspc: 1.5,
                                    fcolor: kGreenColor.withOpacity(.5))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const CategoryDropDown()
              ],
            ),
            kheight,
            LendTextfieldWidget(
              hinttitle: 'Name of tool you want to lend',
              title: 'Title *',
              maxlength: 20,
              widthSize: size.width * .6,
              keyboardType: TextInputType.text,
              controller: provider.titleTextController,
            ),
            kheight20,
            LendTextfieldWidget(
              hinttitle: 'Short details about the tool',
              title: 'Description *',
              maxlength: 6,
              widthSize: 350,
              keyboardType: TextInputType.text,
              controller: provider.descrpTextController,
            ),
            kheight20,
            LendTextfieldWidget(
              textPrefix: '+91 -',
              hinttitle: 'Should not be same as reg *',
              title: 'Phone number *',
              maxlength: 10,
              widthSize: size.width * .7,
              keyboardType: TextInputType.number,
              controller: provider.phoneNumController,
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
                  controller: provider.placeTextController,
                ),
                LendTextfieldWidget(
                  hinttitle: 'Lend rate per day',
                  title: 'Lend rate *',
                  maxlength: 6,
                  widthSize: 160,
                  keyboardType: TextInputType.number,
                  controller: provider.rateTextController,
                ),
              ],
            ),
            kheight20,
            LendTextfieldWidget(
              hinttitle: 'Your current address',
              title: 'Address *',
              widthSize: 350,
              keyboardType: TextInputType.text,
              controller: provider.addressTextController,
            ),
            kheight20,
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              context.read<LendProvider>().postLendTools();
            },
            child: Container(
              width: size.width / 1.4,
              height: size.width * .13,
              decoration: BoxDecoration(
                  color: kGreenColor, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'Save & Make payment',
                  style: poppins(fsize: 16, fcolor: kWhiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
