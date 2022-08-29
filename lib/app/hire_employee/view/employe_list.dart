import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenEmployeeList extends StatelessWidget {
  const ScreenEmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          )),
      body: ListView.separated(
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: kGreyColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kWhiteColor),
                    ),
                   const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Name'),
                        Text('Proffession'),
                        Text('Price'),
                        Text('Rating'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 0,
          );
        }),
        itemCount: 10,
      ),
    );
  }
}
