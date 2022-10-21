import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view/widgets/category_dropdwn.dart';
import 'package:main_project/app/lend_tools/view/widgets/datepick.dart';
import 'package:main_project/app/lend_tools/view/widgets/district_city_dropdown.dart';
import 'package:main_project/app/lend_tools/view/widgets/pick_image.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/need_job/view/widgets/textfield_jobpost_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

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
        child: Form(
          key: LendProvider.formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const ImageWidget(),
              kheight20,
              const DropdownDistrictCity(),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LendDatePickWidget(provider: provider),
                  const CategoryDropDown()
                ],
              ),
              kheight20,
              TextFieldWidget(
                hinttitle: 'Name of your profession',
                title: 'Job title *',
                maxlength: 20,
                validator: provider.checkValidate,
                widthSize: size.width * .6,
                keyboardType: TextInputType.text,
                controller: provider.titleTextController,
              ),
              kheight30,
              TextFieldWidget(
                hinttitle: 'Short note about the job profile',
                title: 'Description *',
                validator: provider.checkValidate,
                widthSize: 350,
                keyboardType: TextInputType.text,
                controller: provider.descrpTextController,
              ),
              kheight30,
              TextFieldWidget(
                textPrefix: '+91 -',
                hinttitle: "Should'nt be same as reg *",
                title: 'Phone number *',
                validator: provider.checkPhone,
                maxlength: 10,
                widthSize: size.width * .7,
                keyboardType: TextInputType.number,
                controller: provider.phoneNumController,
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(
                    hinttitle: 'Your locality',
                    title: 'Place *',
                    validator: provider.checkValidate,
                    maxlength: 20,
                    widthSize: 160,
                    keyboardType: TextInputType.text,
                    controller: provider.placeTextController,
                  ),
                  TextFieldWidget(
                    hinttitle: 'Lent rate per day',
                    title: 'Your lent price *',
                    maxlength: 6,
                    validator: provider.checkValidate,
                    widthSize: 160,
                    keyboardType: TextInputType.number,
                    controller: provider.rateTextController,
                  ),
                ],
              ),
              kheight30,
              TextFieldWidget(
                hinttitle: 'Your current address',
                title: 'Address *',
                widthSize: 350,
                validator: provider.checkValidate,
                keyboardType: TextInputType.text,
                controller: provider.addressTextController,
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (LendProvider.formKey.currentState!.validate()) {
                        context.read<LendProvider>().postLendTools(context);
                      }
                    },
                    child: Container(
                      width: size.width / 1.4,
                      height: size.width * .13,
                      decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Save & Make payment',
                          style: poppins(fsize: 16, fcolor: kWhiteColor),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
