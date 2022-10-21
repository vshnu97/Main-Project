import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/user_profile/view/widget/profile_job_history_widget.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';

class ScreenJobPostedHistory extends StatelessWidget {
  const ScreenJobPostedHistory({
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
            'Job post History',
            style: dmSans(fsize: 18, fcolor: kGreenColor.withOpacity(.8)),
          ),
          backgroundColor: kscaffoldcolor,
        ),
        body: Consumer<UserProfileProvider>(
          builder: (context, UserProfileProvider value, _) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              final item = value.postHistoryList[index];
              final validDate = item.validAt!.toString().substring(0, 10);
              final createdDate = item.validAt!.toString().substring(8, 10);
              final createdMonth = item.validAt!.toString().substring(5, 7);
              value.dateSplit(createdMonth);
              return value.postHistoryList.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : ProfileHistoryWidget(
                      category: item.category!.name.toString(),
                      email: item.bookedPerson == null
                          ? 'anyone '
                          : item.bookedPerson!.email.toString(),
                      name: item.bookedPerson == null
                          ? 'Not booked '
                          : item.bookedPerson!.firstName.toString(),
                      number: item.bookedPerson == null
                          ? 'by'
                          : item.bookedPerson!.mobile.toString(),
                      payment:
                          item.payment == true ? 'Completed' : 'Not completed',
                      valid: validDate,
                      createdDate: createdDate,
                      month: value.dateSplit(createdMonth),
                      containerColor: kYellowHomeColor.withOpacity(.8),
                    );
            },
            itemCount: value.postHistoryList.length,
          ),
        ));
  }
}
