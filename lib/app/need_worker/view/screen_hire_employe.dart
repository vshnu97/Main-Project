import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/widget/grid_hire_employe.dart';
import 'package:main_project/app/need_worker/view/widget/new_worker_listview.dart';
import 'package:main_project/app/need_worker/view/widget/sliverapp_bar.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenHireEmployee extends StatelessWidget {
  const ScreenHireEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<NeedJobPostProvider>();
    final object = context.read<NeedWorkerProvider>();
    return SafeArea(
      child: Consumer<NeedWorkerProvider>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: const Color(0xffe8e9ec),
          body: CustomScrollView(slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: size.height * .16,
              ),
            ),
            SliverFillRemaining(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kheight15,
                          const TitleWidget(
                            title: 'Select by category',
                          ),
                          kheight15,
                          GridViewWiget(
                              provider: provider, size: size, object: object),
                          kheight15,
                          const TitleWidget(
                            title: 'New workers',
                          ),
                          kheight15,
                          NewWorkersListViewWidget(
                            size: size,
                            object: object,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: roboto(
              fsize: 17,
              fweight: FontWeight.w800,
              flettrspc: 0.5,
              fcolor: kGreenColor,
            )),
      ],
    );
  }
}
