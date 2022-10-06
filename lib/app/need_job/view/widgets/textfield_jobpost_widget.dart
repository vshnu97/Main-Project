import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hinttitle;
  final double widthSize;
  final String? textPrefix;
  final int? maxlength;

  final String? Function(String?)? validator;
final TextEditingController controller;
  final TextInputType keyboardType;
  const TextFieldWidget(
      {Key? key,
      this.textPrefix,
      this.validator,
      required this.hinttitle,
      required this.title,
      this.maxlength,
      required this.keyboardType,
       required this.controller,
      required this.widthSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: dmSans(
                fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700)),
        SizedBox(
            width: widthSize,
            child: TextFormField(
               controller: controller,
              style: viga(
                  fweight: FontWeight.w500,
                  fcolor: kGreenColor.withOpacity(.5)),
              cursorColor: kyellowColor,
              keyboardType: keyboardType,
             
              validator: validator,
              maxLength: maxlength,
              decoration: InputDecoration(
                prefixText: textPrefix,
                prefixStyle: viga(fcolor: kGreenColor),
                counterText: '',
                hintText: hinttitle,
                hintStyle: roboto(
                    fcolor: kGreyColor.withOpacity(.6),
                    fweight: FontWeight.w500,
                    fsize: 14),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kyellowColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor),
                ),
              ),
            ))
      ],
    );
  }
}
