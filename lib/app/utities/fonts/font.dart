import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_project/app/utities/colors/colors.dart';

dmSans({
  double fsize = 23,
  fweight = FontWeight.w600,
  fcolor = kBlueColor,
}) {
  return GoogleFonts.dmSans(
      fontSize: fsize, fontWeight: fweight, color: fcolor);
}

poppins(
    {double fsize = 26,
    fweight = FontWeight.bold,
    fcolor = kGreenColor,
    double flettrspc = 2}) {
  return GoogleFonts.poppins(
      fontSize: fsize,
      fontWeight: fweight,
      letterSpacing: flettrspc,
      color: fcolor);
}

ptMono(
    {double fsize = 13,
    fweight = FontWeight.w500,
    fcolor = kBlackColor,
    double flettrspc = 0}) {
  return GoogleFonts.ptMono(
      fontSize: fsize,
      fontWeight: fweight,
      letterSpacing: flettrspc,
      color: fcolor);
}

gFontsLoginbottom(
    {Color dcCl = kWhiteColor,
    var td = TextDecoration.none,
    double sz = 12,
    double ls = 1,
    FontWeight fw = FontWeight.w600,
    Color cl = kBlackColor}) {
  return GoogleFonts.mukta(
    decorationColor: dcCl,
    decoration: td,
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}

gFontsOleo(
    {Color dcCl = kWhiteColor,
    var td = TextDecoration.none,
    double sz = 16,
    double ls = 0,
    FontWeight fw = FontWeight.bold,
    Color cl = kBlackColor}) {
  return GoogleFonts.mukta(
    decorationColor: dcCl,
    decoration: td,
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}
