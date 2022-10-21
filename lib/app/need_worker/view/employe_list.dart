import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/employe_profile.dart';
import 'package:main_project/app/need_worker/view/widget/list_tile_widget.dart';
import 'package:main_project/app/need_worker/view/widget/shimmer_widget.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';
import '../view_model/need_worker_provider.dart';

class ScreenEmployeeList extends StatelessWidget {
  final String name;
  const ScreenEmployeeList({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NeedWorkerProvider>();
    return Scaffold(
      backgroundColor: kscaffoldcolor,
      appBar: AppBar(
          backgroundColor: kscaffoldcolor,
          centerTitle: true,
          title: Text(
            name,
            style: poppins(fcolor: kBlackColor, fsize: 16),
          ),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Routes.popscreen();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          )),
      body: Consumer<NeedWorkerProvider>(
          builder: (BuildContext context, NeedWorkerProvider value, _) {
        return value.sortedData.isEmpty
            ? buildMovieShimmer()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      final item = value.sortedData[index];
                      return ListTileWidget(
                        district: item.district!.district.toString(),
                        image: context
                            .read<NeedJobPostProvider>()
                            .categoryImage(item.category!.name),
                        onclick: () {
                          Routes.push(
                              screen: ScreenEmployeProfile(
                            item: item,
                          ));
                        },
                        rate: "₹ ${item.rate.toString()}.00",
                        title: item.title.toString().toUpperCase(),
                        color:
                            item.available! ? kAvailableGreen : kAvailableRed,
                        shdow:
                            item.available! ? kAvailableGreen : kAvailableRed,
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    }),
                    itemCount: provider.sortedData.length),
              );
      }),
    );
  }

  Widget buildMovieShimmer() => ListView.separated(
      itemBuilder: ((context, index) {
        return ListTile(
          leading: const CustomWidget.rectangular(height: 120, width: 80),
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomWidget.rectangular(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          subtitle: const CustomWidget.rectangular(height: 14),
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 5,
        );
      }),
      itemCount: 15);
}
