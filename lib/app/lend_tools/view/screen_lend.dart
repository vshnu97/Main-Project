import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view/widgets/dropdown_widget.dart';
import 'package:main_project/app/lend_tools/view/widgets/pick_image.dart';
import 'package:main_project/app/lend_tools/view/widgets/textfield_lend.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenLendTools extends StatelessWidget {
  const ScreenLendTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<LendProvider>().postLendTools();
      }),
    );
  }
}

