import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';

class ToolsCategoryListWidget extends StatelessWidget {
  const ToolsCategoryListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 110,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kGreyColor),
                ),
              ),
            );
          })),
    );
  }
}