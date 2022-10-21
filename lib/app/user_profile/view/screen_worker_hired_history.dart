import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/user_profile/view/widget/profile_hire_history_widget.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class ScreenWokerHiredHistory extends StatelessWidget {
  const ScreenWokerHiredHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kscaffoldcolor,
        appBar: AppBar(
          foregroundColor: kGreenColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Workers hired history',
            style: dmSans(fsize: 18, fcolor: kGreenColor.withOpacity(.8)),
          ),
          backgroundColor: kscaffoldcolor,
        ),
        body: Consumer<UserProfileProvider>(
          builder: (context, UserProfileProvider value, _) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              final item = value.workerHiredHistoryList[index];
              final validDate = item.validAt!.toString().substring(0, 10);
              final createdDate = item.validAt!.toString().substring(8, 10);
              final createdMonth = item.validAt!.toString().substring(5, 7);
              value.dateSplit(createdMonth);
              return value.workerHiredHistoryList.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : HiredWokerHistoryWidget(
                      category: item.category!.name.toString(),
                      name: item.title.toString(),
                      number: "+91-${item.user!.mobile.toString()}",
                      payment:
                          item.payment == true ? 'Completed' : 'Not completed',
                      valid: validDate,
                      createdDate: createdDate,
                      month: value.dateSplit(createdMonth),
                      containerColor: kBlueHomeColor.withOpacity(.4),
                      location:
                          '${item.city!.city.toString()} | ${item.district!.district.toString()}',
                      subphone: "+91-${item.subMobile.toString()}",
                      rate: "₹ ${item.rate.toString()}.00",
                    );
            },
            itemCount: value.workerHiredHistoryList.length,
          ),
        ));
  }
}
