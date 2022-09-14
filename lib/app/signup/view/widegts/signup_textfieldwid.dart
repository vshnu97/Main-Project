import 'package:flutter/material.dart';
import 'package:main_project/app/signup/view_model/signup_prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';

class SignUpTextFieldWid extends StatelessWidget {
  final String hintText;
  final IconData iconprefix;
  final TextEditingController? contoller;
  final TextInputType inputType;
  final int? maxlength;

  SignUpTextFieldWid({
    Key? key,
    required this.hintText,
    required this.iconprefix,
    required this.inputType,
    this.maxlength,
    required this.contoller,
    required this.sizez,
  }) : super(key: key);

  final Size sizez;

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
        maxLength: maxlength,
        controller: contoller,
        keyboardType: inputType,
        style: TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          prefixIcon: Icon(iconprefix, color: kBlackColor.withOpacity(.7)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
        ),
      ),
    );
  }
}

class ConfirmPasswTextField extends StatelessWidget {
  const ConfirmPasswTextField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 7,
      width: size.width / 1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
          color: const Color(0xffA3C4CC).withOpacity(.3),
          borderRadius: BorderRadius.circular(10)),
      child: Consumer<SignUpProv>(
        builder: (context, value, child) => TextFormField(
          controller: context.read<SignUpProv>().signUpConfrmController,
          obscureText: context.read<SignUpProv>().isobscureConfirm,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.password_outlined,
                  color: kBlackColor.withOpacity(.7)),
              hintText: 'Confirm Password',
              hintStyle:
                  TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<SignUpProv>().passwordHideConfirm();
                },
                icon: Icon(context.read<SignUpProv>().isobscureConfirm
                    ? Icons.visibility
                    : Icons.visibility_off),
                color: kGreenColor,
              )),
        ),
      ),
    );
  }
}

class SignUpPassTextFieldWidget extends StatelessWidget {
  SignUpPassTextFieldWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 7,
      width: size.width / 1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
          color: const Color(0xffA3C4CC).withOpacity(.3),
          borderRadius: BorderRadius.circular(10)),
      child: Consumer<SignUpProv>(
        builder: (context, value, child) => TextFormField(
          controller: context.read<SignUpProv>().signUppasswrdController,
          obscureText: context.read<SignUpProv>().isObscure,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(focus);
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.password_outlined,
                  color: kBlackColor.withOpacity(.7)),
              hintText: 'Password',
              hintStyle:
                  TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<SignUpProv>().passwordHide();
                },
                icon: Icon(context.read<SignUpProv>().isObscure
                    ? Icons.visibility
                    : Icons.visibility_off),
                color: kGreenColor,
              )),
        ),
      ),
    );
  }
}
