import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/colors/colors.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(170),
              child: AppBar(
                backgroundColor: kGreenColor,
                leading: InkWell(
                    onTap: () {
                      Routes.popscreen();
                    },
                    child:
                        const Icon(Icons.arrow_back_ios, color: kWhiteColor)),
                elevation: 0.0,
                title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffE4BB50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ImageSlideshow(
                    width: double.infinity,
                    height: 220,
                    initialPage: 0,
                    indicatorRadius: 0,
                    onPageChanged: (value) {},
                    autoPlayInterval: 5000,
                    isLoop: true,
                    children: const [
                      CaroselWorkersWidget(
                        image: 'assests/carosel2.webp',
                      ),
                      CaroselWorkersWidget(
                        image: 'assests/carosel4.webp',
                      ),
                      CaroselWorkersWidget(
                        image: 'assests/carosl3.webp',
                      ),
                      CaroselWorkersWidget(
                        image: 'assests/carosl1.webp',
                      ),
                      CaroselWorkersWidget(
                        image: 'assests/carosel5.webp',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CaroselWorkersWidget extends StatelessWidget {
  final String image;
  const CaroselWorkersWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
