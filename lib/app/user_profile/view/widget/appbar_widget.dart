import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * .25,
          decoration: const BoxDecoration(
            color: kGreenColor,
          ),
        ),
        Positioned(
            left: 10,
            top: 10,
            child: InkWell(
                onTap: () {
                  Routes.popscreen();
                },
                child: const Icon(Icons.arrow_back_ios, color: kWhiteColor))),
        Consumer<UserProfileProvider>(
          builder: (context, value, child) => Positioned(
            top: size.height * .16,
            left: size.width * .1,
            right: size.width * .1,
            child: Container(
              height: size.height * .18,
              decoration: BoxDecoration(
                  color: const Color(0xffE8F4F2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    value.userData == null
                        ? 'Username'
                        : value.userData!.name.toString(),
                    style: viga(fcolor: kGreenColor, flettrspc: 2),
                  ),
                  kheight5,
                  Text(
                      value.userData == null
                          ? 'Email'
                          : value.userData!.email.toString(),
                      style: viga(
                          fcolor: kGreenColor,
                          fweight: FontWeight.w300,
                          fsize: 14)),
                  kheight20
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: size.width * .1,
            right: size.width * .1,
            top: size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selector<UserProfileProvider, String>(
                    selector:
                        (BuildContext context, UserProfileProvider value) =>
                            value.userImage,
                    builder: (context, String userImage, child) {
                      return Stack(
                        children: [
                          userImage.trim().isEmpty
                              ? const CircleAvatar(
                                  radius: 60,
                                )
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(
                                      const Base64Decoder().convert(userImage)),
                                  radius: 60,
                                ),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<UserProfileProvider>()
                                      .pickUserImage();
                                },
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        kyellowColor.withOpacity(.5),
                                    child: const Icon(
                                      Icons.add_a_photo,
                                      size: 20,
                                      color: kGreenColor,
                                    )),
                              ))
                        ],
                      );
                    }),
              ],
            ))
      ],
    );
  }
}
