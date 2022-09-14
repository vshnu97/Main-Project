import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view/widgets/dropdown.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenNeedJob extends StatelessWidget {
  const ScreenNeedJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
       backgroundColor: kWhiteColor,
        leading: InkWell(
          onTap: (){
            Routes.popscreen();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownWidget(
                    title: 'District *',
                  ),
                  DropdownWidget(
                    title: 'City *',
                  ),
                ],
              ),
              kheight30,
              JobDesTextFieldWidget(
                title: 'Phone number *',
                hintText: 'Number should not be same as reg*',
              ),
              kheight30,
              DropdownWidget(
                title: 'Job Category *',
              ),
              kheight30,
              JobDesTextFieldWidget(
                title: 'Jole role *',
              ),
              kheight30,
              JobDesTextFieldWidget(
                title: 'Jole description ',
              ),
              kheight30,
              JobDesTextFieldWidget(
                title: 'Address ',
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Place',
                        style: dmSans(
                            fcolor: kGreenColor,
                            fsize: 20,
                            fweight: FontWeight.w700),
                      ),
                      SizedBox(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: kBlackColor.withOpacity(.4),
                                  fontSize: 14),
                            ),
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rate /day',
                        style: dmSans(
                            fcolor: kGreenColor,
                            fsize: 20,
                            fweight: FontWeight.w700),
                      ),
                      SizedBox(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: kBlackColor.withOpacity(.4),
                                  fontSize: 14),
                            ),
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JobDesTextFieldWidget extends StatelessWidget {
  String title;
  String? hintText;

  JobDesTextFieldWidget({Key? key, required this.title, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              dmSans(fcolor: kGreenColor, fsize: 20, fweight: FontWeight.w700),
        ),
        SizedBox(
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(color: kBlackColor.withOpacity(.4), fontSize: 14),
              ),
            ))
      ],
    );
  }
}
