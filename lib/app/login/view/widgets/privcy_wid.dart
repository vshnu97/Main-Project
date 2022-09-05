import 'package:flutter/material.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class PrivacyWid extends StatelessWidget {
  const PrivacyWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}