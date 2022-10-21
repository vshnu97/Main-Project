import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/payment/view/widget/floating_button_widget.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';
import 'package:main_project/app/need_worker/payment/view_model/get_worker_payment.dart';
import 'package:main_project/app/need_worker/view/widget/worker_profilepage_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenEmployeProfile extends StatelessWidget {
  final FilterOnJobCateResponseModel item;
  const ScreenEmployeProfile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = item.validAt!.toString().substring(0, 10);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kscaffoldcolor,
      appBar: AppBar(
        backgroundColor: kscaffoldcolor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Routes.popscreen();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kGreenColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              WorkerProfilePageWidget(
                address: item.address.toString(),
                profession: item.title.toString().toUpperCase(),
                city: item.city!.city.toString(),
                date: number,
                description: item.discriptions.toString(),
                district: item.district!.district.toString(),
                rate: item.rate.toString(),
                image: context
                    .read<NeedJobPostProvider>()
                    .categoryImage(item.category!.name),
              ),
              kheight30,
              Consumer<UserProfileProvider>(
                builder: (context, value, child) {
              
              return   Column(
                  children: [
                    // Text(value.userData!.count.toString()),
                    Text(
                      'To get this skilled professional',
                      style:
                          poppins(fcolor: kGreenColor, fsize: 17, flettrspc: 0),
                    ),
                    kheight5,
                   Text(
                      '*make payment and get contact\ndetails*',
                      style: poppins(
                          fsize: 12,
                          flettrspc: 1,
                          fcolor: kAvailableRed.withOpacity(.8)),
                      textAlign: TextAlign.center,
                    )
                  ],
                );}
              ),
              kheight100
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        size: size,
        onClick: () {
          context.read<UserProfileProvider>().getUserData();
          context
              .read<GetWorkerRazorpayProvider>()
              .getWorkerPayment(item.id.toString());
        },
        title: 'Make payment',
      ),
    );
  }

}
