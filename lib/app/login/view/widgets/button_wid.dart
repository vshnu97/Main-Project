import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/login/view_model/login.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';

class SignInLogInButtonWid extends StatelessWidget {
  VoidCallback onClick;
  String title;
  SignInLogInButtonWid({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<HomeProv>(
        builder: (context, value, child) => MaterialButton(
          onPressed: onClick,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          color: kGreenColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: value.isLoading
                ? const CupertinoActivityIndicator(
                    color: kWhiteColor,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
