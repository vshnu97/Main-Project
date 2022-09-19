import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/login/view/widgets/button_wid.dart';
import 'package:main_project/app/login/view/widgets/create_reg.dart';
import 'package:main_project/app/login/view/widgets/divider_wid.dart';
import 'package:main_project/app/login/view/widgets/privcy_wid.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/signup/view/screen_otp.dart';
import 'package:main_project/app/signup/view/widegts/signup_textfieldwid.dart';
import 'package:main_project/app/signup/view_model/signup_prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SignUpProv>(context);
    Size sizez = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            color: const Color(0xffededec),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Image.asset(
                      'assests/iop.png',
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignUpTextFieldWid(
                            hintText: "Enter your name",
                            iconprefix: Icons.person,
                            inputType: TextInputType.text,
                            sizez: sizez,
                            contoller: prov.signUpnameController,
                          ),
                          SignUpTextFieldWid(
                            hintText: "Enter your email",
                            iconprefix: Icons.email,
                            inputType: TextInputType.emailAddress,
                            sizez: sizez,
                            contoller: prov.signUpEmailController,
                          ),
                          SignUpTextFieldWid(
                            hintText: "Enter your phone number",
                            iconprefix: Icons.phone_android,
                            inputType: TextInputType.number,
                            maxlength: 10,
                            sizez: sizez,
                            contoller: prov.signUpPhoneNumControler,
                          ),
                          SignUpPassTextFieldWidget(
                            size: sizez,
                          ),
                          ConfirmPasswTextField(size: sizez),
                          kheight5,
                          SignInLogInButtonWid(
                            onClick: () {
                               prov.signInDataBase(context);
                              // RoutesScreen().pushScreen(context, const ScreenOtp());
                              Routes.push(screen: const ScreenOtp());
                            },
                            title: 'Signin',
                          ),
                          const CreateOrRegisterWid(
                              screen: ScreenLogin(),
                              subtitle: 'Log In',
                              title: 'Already have an account ?'),
                          DividerWid(size: size),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                radius: 10,
                                onTap: () {},
                                child: Container(
                                  height: size * .13,
                                  width: size * .13,
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
                const PrivacyWid(),
                kheight
              ],
            ),
          ),
        ),
      ),
    );
  }
}
