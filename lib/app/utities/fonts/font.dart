import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_project/app/utities/colors/colors.dart';

dmSans(
    {double fsize = 23,
    fweight = FontWeight.w600,
    fcolor = kBlueColor,
   double flettrspc = 0}) {
  return GoogleFonts.dmSans(
      fontSize: fsize,
      fontWeight: fweight,
      color: fcolor,
      letterSpacing: flettrspc);
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
    double sz = 11,
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

redRose({
  double fsize = 17,
  fweight = FontWeight.w700,
  fcolor = kBlackColor,
}) {
  return GoogleFonts.redRose(
      fontSize: fsize, fontWeight: fweight, color: fcolor);
}

dmMono(
    {double fsize = 16,
    fweight = FontWeight.w500,
    fcolor = kBlackColor,
    double flettrspc = 1}) {
  return GoogleFonts.dmMono(
      fontSize: fsize,
      fontWeight: fweight,
      letterSpacing: flettrspc,
      color: fcolor);
}

roboto(
    {double fsize = 16,
    fweight = FontWeight.w600,
    fcolor = kGreyColor,
    double flettrspc = 1}) {
  return GoogleFonts.roboto(
      fontSize: fsize,
      fontWeight: fweight,
      letterSpacing: flettrspc,
      color: fcolor);
}
