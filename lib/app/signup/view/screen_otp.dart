import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';

class ScreenOtp extends StatelessWidget {
  const ScreenOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Image.asset('assests/ottp.png',height: 250,),
            Text(
              'OTP Verification',
              style: dmSans(
                  fcolor: kGreenColor,
                  fweight: FontWeight.w800,
                  flettrspc: 1,
                  fsize: 25),
            ),
            kheight,
            const Text('We sent your code to +91 XXXX XX ****',
                style: TextStyle(fontSize: 15)),
            kheight5,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'This will expire in ',
            //       style: roboto(flettrspc: 0),
            //     ),
            //     // TweenAnimationBuilder(
            //     //     tween: Tween(begin: 50.0, end: 0),
            //     //     duration: const Duration(seconds: 50),
            //     //     builder: (context, value, child) => Text(
            //     //           "00:$value",
            //     //           style: roboto(fcolor: Colors.red),
            //     //         ))
            //   ],
            // ),
            kheight20,
            Row(
              children: const [
                Expanded(flex: 1, child: OtpFieldWid()),
                kwidth,
                Expanded(flex: 1, child: OtpFieldWid()),
                kwidth,
                Expanded(flex: 1, child: OtpFieldWid()),
                kwidth,
                Expanded(flex: 1, child: OtpFieldWid()),
                kwidth,
                Expanded(flex: 1, child: OtpFieldWid()),
                kwidth,
                Expanded(flex: 1, child: OtpFieldWid())
              ],
            ),
            kheight30,
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
                    'Verify OTP',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpFieldWid extends StatelessWidget {
  const OtpFieldWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).previousFocus();
        }
      },
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      maxLength: 1,
      style: GoogleFonts.viga(
          color: kBlackColor, fontWeight: FontWeight.w500, fontSize: 30),
      decoration: InputDecoration(
          counterText: "",
          hintText: '0',
          hintStyle: GoogleFonts.viga(
              color: kBlackColor.withOpacity(.3),
              fontWeight: FontWeight.w500,
              fontSize: 30),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor))),
    );
  }
}
