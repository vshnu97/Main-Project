import 'package:flutter/material.dart';
import 'package:main_project/app/lend_tools/view_model/lend_provider.dart';
import 'package:main_project/app/login/view_model/login.dart';
import 'package:main_project/app/need_job/payment/view_model/post_payment.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/rent_tools/payment/view_model/payment_provider.dart';
import 'package:main_project/app/rent_tools/view_model/rent_all_provider.dart';
import 'package:main_project/app/rent_tools/view_model/rent_item_view_provider.dart';
import 'package:main_project/app/signup/view_model/otp.prov.dart';
import 'package:main_project/app/signup/view_model/signup_prov.dart';
import 'package:main_project/app/splash_screen/view_model/splash_provider.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/main.dart';
import 'package:provider/provider.dart';

class Providers {
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProv>(create: ((context) => HomeProv())),
        ChangeNotifierProvider<SignUpProv>(create: ((context) => SignUpProv())),
        ChangeNotifierProvider<OtpProv>(create: ((context) => OtpProv())),
        ChangeNotifierProvider<LendProvider>(
            create: ((context) => LendProvider())),
        ChangeNotifierProvider<RazorpayProvider>(
            create: ((context) => RazorpayProvider())),
        ChangeNotifierProvider<SplashProvider>(
            create: ((context) => SplashProvider())),
        ChangeNotifierProvider<RentAllProvider>(
            create: ((context) => RentAllProvider())),
        ChangeNotifierProvider<RentItemViewProvider>(
            create: ((context) => RentItemViewProvider())),
        ChangeNotifierProvider<UserProfileProvider>(
            create: ((context) => UserProfileProvider())),
        ChangeNotifierProvider<NeedJobPostProvider>(
            create: ((context) => NeedJobPostProvider())),
        ChangeNotifierProvider<PostJobRazorpayProvider>(
            create: ((context) => PostJobRazorpayProvider())),
            ChangeNotifierProvider<NeedWorkerProvider>(
            create: ((context) => NeedWorkerProvider())),
      ],
      child: const MyApp(),
    );
  }
}
