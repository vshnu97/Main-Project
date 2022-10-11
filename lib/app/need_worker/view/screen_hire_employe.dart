import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/employe_list.dart';
import 'package:main_project/app/need_worker/view/widget/shimmer_widget.dart';
import 'package:main_project/app/need_worker/view/widget/sliverapp_bar.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/routes/routes.dart';
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
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleWidget(
                            title: 'Select by category',
                          ),
                          kheight15,
                          GridViewWiget(
                              provider: provider, size: size, object: object),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kheight15,
                          const TitleWidget(
                            title: 'New workers',
                          ),
                          kheight15,
                          NewWorkersListViewWidget(size: size)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class NewWorkersListViewWidget extends StatelessWidget {
  const NewWorkersListViewWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: size.height * .26,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () {
                  // Routes.push(screen:  ScreenEmployeeList());
                },
                child: Container(
                  height: size.height * .26,
                  width: size.width * .5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kGreyColor),
                ),
              ),
            );
          })),
    );
  }
}

class GridViewWiget extends StatelessWidget {
  const GridViewWiget({
    Key? key,
    required this.provider,
    required this.size,
    required this.object,
  }) : super(key: key);

  final NeedJobPostProvider provider;
  final Size size;
  final NeedWorkerProvider object;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: object.availableList.isEmpty
          ? buildMovieShimmer()
          : AnimationLimiter(
              child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  childAspectRatio: .9,
                  crossAxisSpacing: 8,
                  children: List<Widget>.generate(object.availableList.length,
                      (index) {
                    return AnimationConfiguration.staggeredGrid(
                      duration: const Duration(milliseconds: 500),
                      columnCount: 4,
                      position: index,
                      child: GestureDetector(
                          onTap: () {
                            object.sortedData.clear();
                            object.categoryFiltered(
                                object.availableList[index].id);
                                Routes.push(screen:  ScreenEmployeeList(name: object.availableList[index].name));
                          },
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        color: kGreyColor.withOpacity(.4),
                                        spreadRadius: 2)
                                  ],
                                ),
                                child: Column(children: [
                                  kheight5,
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xff154c79),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    height: size.height * .056,
                                    width: size.height * .055,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff154c79),
                                      child: Image.asset(
                                        provider.imagesList[index],
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 5),
                                    child: Text(
                                      object.availableList[index].name,
                                      textAlign: TextAlign.center,
                                      style: roboto(
                                          fsize: 12,
                                          fcolor: kGreenColor,
                                          fweight: FontWeight.w700,
                                          flettrspc: .5),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          )),
                    );
                  })),
            ),
    );
  }

  Widget buildMovieShimmer() => GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 2,
      childAspectRatio: .9,
      crossAxisSpacing: 8,
      children: List<Widget>.generate(16, (index) {
        return const CustomWidget.circular(height: 50, width: 50);
      }));
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
              fsize: 18,
              fweight: FontWeight.w700,
              fcolor: kGreenColor,
            )),
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
