import 'package:flutter/material.dart';
import 'package:main_project/app/login/viewmodel/login.dart';
import 'package:main_project/app/utities/colors/colors.dart';

class SignInLogInButtonWid extends StatelessWidget {
  VoidCallback onClick;
  SignInLogInButtonWid({
    Key? key,
    required this.prov,
    required this.onClick,
  }) : super(key: key);

  final HomeProv prov;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: 
          onClick,
       
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        color: kGreenColor,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Login',
            style: TextStyle(
                color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}