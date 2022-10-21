import 'package:flutter/cupertino.dart';
import 'package:main_project/app/need_worker/view/screen_allworker_profile.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class NewWorkersListViewWidget extends StatelessWidget {
  final NeedWorkerProvider object;
  const NewWorkersListViewWidget({
    Key? key,
    required this.size,
    required this.object,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: size.height * .28,
      child: object.allJobsList.isEmpty
          ? const CupertinoActivityIndicator()
          : ListView.separated(
            physics:const BouncingScrollPhysics() ,
              itemCount:
                  object.allJobsList.length > 5 ? 5 : object.allJobsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final item = object.allJobsList[index];

                return GestureDetector(
                  onTap: () {
                    context.read<UserProfileProvider>().getUserData();
                    Routes.push(screen: ScreenAllWorkerProfile(item: item));
                  },
                  child: FractionallySizedBox(
                    heightFactor: .95,
                    child: Container(
                      width: size.width * .5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff718a8c).withOpacity(.4),
                                blurRadius: 5,
                                blurStyle: BlurStyle.inner,
                                offset: const Offset(5, 5))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: kappleGreen),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * .5,
                            height: size.height * .16,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      object.categoryImage(item.category!.name),
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                                color: kGreenColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                kheight,
                                Text(
                                  item.title!.toString(),
                                  style: dmSans(
                                      fsize: 20,
                                      fcolor: kGreenColor,
                                      fweight: FontWeight.w700),
                                ),
                                Text(
                                  item.category!.name.toString(),
                                  style: dmSans(
                                      fsize: 14,
                                      flettrspc: 1.5,
                                      fcolor: kGreenColor.withOpacity(.6),
                                      fweight: FontWeight.w600),
                                ),
                                kheight5,
                                Text(
                                  "₹ ${item.rate!.toString()}.00 /day",
                                  style: dmSans(
                                      fsize: 14,
                                      fcolor: kGreenColor,
                                      fweight: FontWeight.w900),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return kwidth;
              },
            ),
    );
  }
}
