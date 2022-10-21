
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/employe_list.dart';
import 'package:main_project/app/need_worker/view/widget/shimmer_widget.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

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
          ?  buildMovieShimmer()
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
                            Routes.push(
                                screen: ScreenEmployeeList(
                                    name: object.availableList[index].name));
                          },
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kWhiteColor.withOpacity(.8),
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
                                        provider.categoryImage(object
                                            .availableList[index].name
                                            .toString()),
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
 
}
