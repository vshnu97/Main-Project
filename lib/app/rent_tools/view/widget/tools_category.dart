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
    final provider = context.read<RentAllProvider>();
    return LimitedBox(
      maxHeight: 110,
      child: ListView.builder(
          itemCount: provider.categoryTools.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            final catagoryName = provider.categoryTools[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Routes.push(
                      screen: ScreenRentAllCategoryWise(
                    categoryName: catagoryName,
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 110,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPinkHomeColor.withOpacity(.6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        provider.categoryImages[index],
                        height: 55,
                      ),
                      Text(
                        provider.categoryTools[index],
                        style: dmSans(
                            fcolor: kBlackColor, fsize: 14, flettrspc: .8),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
