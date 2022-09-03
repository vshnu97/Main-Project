import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/bottom_sheet.dart';
import 'package:main_project/app/login/viewmodel/login.dart';
import 'package:main_project/app/routes/routes.dart';
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
                  flex: 3,
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
                        Container(
                          height: sizez.width / 7,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: sizez.width / 30),
                          decoration: BoxDecoration(
                              color: const Color(0xffA3C4CC).withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: prov.loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: kBlackColor.withOpacity(.8),
                                letterSpacing: .8),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email,
                                  color: kBlackColor.withOpacity(.7)),
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                  color: kBlackColor.withOpacity(.5),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          height: sizez.width / 7,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: sizez.width / 30),
                          decoration: BoxDecoration(
                              color: const Color(0xffA3C4CC).withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: prov.passwordController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: kBlackColor.withOpacity(.8),
                                letterSpacing: .8),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.password,
                                  color: kBlackColor.withOpacity(.7)),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                  color: kBlackColor.withOpacity(.5),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              prov.loginDataBase(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            color: kGreenColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Login',
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
                            Text("Create a new account?",
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
                                    .pushScreen(context, const ScreenSignUp());
                              },
                              child: const Text(
                                "Sign Up",
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
                              width: (size / 2.2),
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
                              width: (size / 2.5),
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
                                    backgroundColor:
                                        kWhiteColor, // <-- SEE HERE
                                    builder: (context) {
                                      return SizedBox(
                                        height: 160,
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
                                height: 50,
                                width: 50,
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
                          ],
                        ),
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
