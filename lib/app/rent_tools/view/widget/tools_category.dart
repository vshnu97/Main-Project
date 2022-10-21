import 'package:flutter/material.dart';
import 'package:main_project/app/rent_tools/view/screen_categorywise.dart';
import 'package:main_project/app/rent_tools/view_model/rent_all_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class ToolsCategoryListWidget extends StatelessWidget {
  const ToolsCategoryListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<RentAllProvider>();
    return LimitedBox(
      maxHeight: size.height * .15,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: provider.categoryTools.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            final catagoryName = provider.categoryTools[index];
            return GestureDetector(
              onTap: () {
                Routes.push(
                    screen: ScreenRentAllCategoryWise(
                  categoryName: catagoryName,
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(4),
               
                width: size.width*.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kscaffoldcolor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: kGreyColor,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: kWhiteColor,
                          child: Image.asset(
                            provider.categoryImages[index],
                            height: 45,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      provider.categoryTools[index],
                      style: dmSans(
                          fcolor: kBlackColor,
                          fsize: 13,
                          flettrspc: .5,
                          fweight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
