import 'package:flutter/material.dart';
import 'package:main_project/app/signup/model/response_signup.dart';
import 'package:main_project/app/signup/view_model/otp.prov.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:main_project/app/utities/sizedbox/sizedbox.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatelessWidget {
 final ResponseSignUpModel response;
    const ScreenOtp(  {Key? key,required this.response}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   final number =response.mobile!.substring(6,10);
    final prov = Provider.of<OtpProv>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
       
        
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
              
               
              const Text(
                'We have sent your code to',
                style: TextStyle(fontSize: 15),
              ),
               kheight5,
              Text('+91 XXXX XX $number',
                  style: const TextStyle(fontSize: 15)),
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
                     context.read<OtpProv>().otdDataBse(response);
                   
                   
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
          hintText: '*',
          hintStyle: viga(
              fcolor: kBlackColor.withOpacity(.3),
              fweight: FontWeight.w500,
              fsize: 30),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor))),
    );
  }
}
