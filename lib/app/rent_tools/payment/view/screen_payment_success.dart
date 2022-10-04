import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class ScreenPaymentSuccess extends StatefulWidget {
final  String image;
final  String title;
final  Widget child;

  const ScreenPaymentSuccess(
      {Key? key, required this.child, required this.image, required this.title})
      : super(key: key);

  @override
  State<ScreenPaymentSuccess> createState() => _ScreenPaymentSuccessState();
}

class _ScreenPaymentSuccessState extends State<ScreenPaymentSuccess> {
  @override
  void initState() {
    gotoHome(widget.child);
    super.initState();
  }

  Future gotoHome(Widget child) async {
    await Future.delayed(const Duration(seconds: 3));
   Routes.pushreplace(screen: child);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: size.height / 3.75,
              width: size.width / 4,
              child: Animator<double>(
                duration: const Duration(milliseconds: 2000),
                cycles: 0,
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: 10.0),
                builder: (context, animatorState, child) => Column(
                  children: [
                    SizedBox(
                      height: animatorState.value * 5,
                    ),
                    Container(child: Image.asset(widget.image)),
                  ],
                ),
              ),
            ),
          ),
          Text(
            widget.title,
            style: roboto(fsize: 20, flettrspc: 2),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
