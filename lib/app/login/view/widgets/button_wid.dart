import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';

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
      child: MaterialButton(
        onPressed: 
          onClick,
       
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        color: kGreenColor,
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: const TextStyle(
                color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}