import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/bottom_sheet.dart';
import 'package:main_project/app/login/view/widgets/button_wid.dart';
import 'package:main_project/app/login/view/widgets/create_reg.dart';
import 'package:main_project/app/login/view/widgets/divider_wid.dart';
import 'package:main_project/app/login/view/widgets/login_textfield.dart';
import 'package:main_project/app/login/view/widgets/privcy_wid.dart';
import 'package:main_project/app/login/viewmodel/login.dart';
import 'package:main_project/app/signup/view/screen_signup.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeProv>(context);
    Size sizez = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            color: const Color(0xffededec),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assests/imgLogin.png'),
                                fit: BoxFit.cover)),
                        width: double.infinity,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'On-Demand',
                                style: roboto(
                                  fcolor: kGreenColor,
                                  fsize: 25,
                                  fweight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'HIRE  |  POST  |  LEND  |  RENT',
                                style: gFontsLoginbottom(
                                    cl: kBlackColor.withOpacity(.5)),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LoginTexfieldWidget(
                          nexT: TextInputAction.next,
                          sizez: sizez,
                          prov: prov,
                          controller: prov.loginEmailController,
                          hinttext: 'Enter your email',
                          inputTextType: TextInputType.emailAddress,
                          prefixicon: Icons.email,
                          isoBsecure: false,
                        ),
                        LoginTexfieldWidget(
                          nexT: TextInputAction.done,
                          isoBsecure: context.read<HomeProv>().isObscure,
                          sizez: sizez,
                          prov: prov,
                          controller: prov.passwordController,
                          hinttext: 'Enter your password',
                          inputTextType: TextInputType.text,
                          prefixicon: Icons.password,
                          suffexicon1: Icons.visibility,
                          suffexicon2: Icons.visibility_off,
                        ),
                        SignInLogInButtonWid(
                          prov: prov,
                          onClick: () {
                            prov.loginDataBase(context);
                          },
                        ),
                        const CreateOrRegisterWid(
                          screen: ScreenSignUp(),
                          subtitle: 'Sign Up',
                          title: 'Create a new account ?',
                        ),
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
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0),
                                      ),
                                    ),
                                    backgroundColor: kWhiteColor,
                                    builder: (context) {
                                      return SizedBox(
                                        height: size * .408,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 25),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  BottomSheetContainerWid(
                                                    image: 'assests/fb.png',
                                                    title:
                                                        'Continue with Facebook',
                                                  ),
                                                  kheight,
                                                  BottomSheetContainerWid(
                                                    image: 'assests/gm.png',
                                                    title:
                                                        'Continue with Gmail ',
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: size * .13,
                                width: size * .13,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Image.asset(
                                  'assests/more.png',
                                ),
                              ),
                            )
                          ],
                        ),
                        const PrivacyWid(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
