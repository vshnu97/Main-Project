import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/signup/view/widegts/signup_textfieldwid.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizez = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color(0xffededec),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Row(
                        children: [Image.asset('assests/man.png')],
                      ),
                     
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SignUpTextFieldWid(
                            hintText: "Enter your name",
                            iconprefix: Icons.person,
                            inputType: TextInputType.text,
                            sizez: sizez),
                        SignUpTextFieldWid(
                            hintText: "Enter your email",
                            iconprefix: Icons.email,
                            inputType: TextInputType.emailAddress,
                            sizez: sizez),
                        SignUpTextFieldWid(
                            hintText: "Enter your phone number",
                            iconprefix: Icons.phone_android,
                            inputType: TextInputType.number,
                            maxlength: 10,
                            sizez: sizez),
                        SignUpPassTextFieldWidget(
                          size: sizez,
                        ),
                        ConfirmPasswTextField(size: sizez),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            color: kGreenColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account?",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor.withOpacity(.4))),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                RoutesScreen()
                                    .pushScreen(context, const ScreenLogin());
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: kGreenColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: (size / 2.4),
                              child: const Divider(),
                            ),
                            Text(
                              "Or",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: kGreyColor.withOpacity(.6)),
                            ),
                            SizedBox(
                              width: (size / 2.4),
                              child: const Divider(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              radius: 10,
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Image.asset(
                                  'assests/google.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Column(
                children: [
                  Text(
                    'By continuing, you agreed to our',
                    style: gFontsLoginbottom(),
                  ),
                  Text(
                    'Terms and Privacy Policy',
                    style: gFontsLoginbottom(),
                  ),
                  kheight,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
