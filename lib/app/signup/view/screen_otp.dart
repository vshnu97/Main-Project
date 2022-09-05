import 'package:flutter/material.dart';
import 'package:main_project/app/signup/viewmodel/otp.prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatelessWidget {
  const ScreenOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<OtpProv>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Image.asset(
              'assests/ottp.png',
              height: 250,
            ),
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
            kheight20,
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp1,
                    )),
                kwidth,
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp2,
                    )),
                kwidth,
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp3,
                    )),
                kwidth,
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp4,
                    )),
                kwidth,
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp5,
                    )),
                kwidth,
                Expanded(
                    flex: 1,
                    child: OtpFieldWid(
                      controller: prov.otp6,
                    ))
              ],
            ),
            kheight30,
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  context.read<OtpProv>().otdDataBse();
                },
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
  final TextEditingController controller;
  const OtpFieldWid({Key? key, required this.controller}) : super(key: key);

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
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      maxLength: 1,
      style: viga(fcolor: kBlackColor, fweight: FontWeight.w500, fsize: 30),
      decoration: InputDecoration(
          counterText: "",
          hintText: '0',
          hintStyle: viga(
              fcolor: kBlackColor.withOpacity(.3),
              fweight: FontWeight.w500,
              fsize: 30),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor))),
    );
  }
}
