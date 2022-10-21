import 'package:flutter/material.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/need_job/model/jobpost_paid_response.dart';
import 'package:main_project/app/need_job/payment/view/widget/floating_button_widget.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/widget/worker_profilepage_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenJobPostSuccess extends StatelessWidget {
  JobPostPaidResponseModel? response;

  ScreenJobPostSuccess({
    Key? key,
    this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = response!.validAt!.toString().substring(0, 10);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kscaffoldcolor,
        elevation: 0,
      ),
      backgroundColor: kscaffoldcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              WorkerProfilePageWidget(
                address: response!.address.toString(),
                profession: response!.title.toString().toUpperCase(),
                city: response!.city!.city.toString(),
                date: number,
                description: response!.discriptions.toString(),
                district: response!.district!.district.toString(),
                rate: response!.rate.toString(),
                image: context
                    .read<NeedJobPostProvider>()
                    .categoryImage(response!.category!.name),
              ),
              kheight30,
              Column(
                children: [
                  Text(
                    'Your job has been successfully posted',
                    style: poppins(
                        fcolor: kAvailableGreen, fsize: 17, flettrspc: 0),
                  ),
                  kheight5,
                  Text(
                    'The post is now live',
                    style: poppins(
                        fsize: 14,
                        flettrspc: 0.5,
                        fcolor: kGreyColor.withOpacity(.8)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              kheight100
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        size: size,
        onClick: () {
          Routes.pushremoveUntil(screen: const ScreenHome());
        },
        title: 'Continue',
      ),
    );
  }
}
