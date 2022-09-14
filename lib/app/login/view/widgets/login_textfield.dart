import 'package:flutter/material.dart';
import 'package:main_project/app/login/view_model/login.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';

class LoginTexfieldWidget extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  TextInputType inputTextType;
  IconData prefixicon;
  IconData? suffexicon1;
  IconData? suffexicon2;
  bool isoBsecure;
  final Size sizez;
  final HomeProv prov;

  LoginTexfieldWidget({
    Key? key,
    required this.sizez,
    required this.prov,
    required this.controller,
    required this.hinttext,
    required this.inputTextType,
    required this.prefixicon,
    this.suffexicon1,
    this.suffexicon2,
    required this.isoBsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizez.width / 7,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: sizez.width / 30),
      decoration: BoxDecoration(
          color: const Color(0xffA3C4CC).withOpacity(.3),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: isoBsecure,
        controller: controller,
        keyboardType: inputTextType,
        style: TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(prefixicon, color: kBlackColor.withOpacity(.7)),
            hintText: hinttext,
            hintStyle:
                TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
            suffixIcon: IconButton(
              onPressed: () {
                context.read<HomeProv>().passwordHide();
              },
              icon: Icon(context.read<HomeProv>().isObscure
                  ? suffexicon1
                  : suffexicon2),
              color: kGreenColor,
            )),
      ),
    );
  }
}
