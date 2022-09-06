import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/login.dart';
import 'package:main_project/app/login/view/widgets/button_wid.dart';
import 'package:main_project/app/login/view/widgets/create_reg.dart';
import 'package:main_project/app/login/view/widgets/divider_wid.dart';
import 'package:main_project/app/login/view/widgets/privcy_wid.dart';
import 'package:main_project/app/signup/view/widegts/signup_textfieldwid.dart';
import 'package:main_project/app/signup/viewmodel/signup_prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
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
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Row(
                          children: [Image.asset('assests/man.png'),
                          Text('Create account',style: viga(fcolor: kGreenColor,fsize: 25),)
                          ],
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
                          SignInLogInButtonWid(onClick: () {
                            prov.signInDataBase(context);
                          }, title: 'Signin',),
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
