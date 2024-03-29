import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';

class KTextTheme {
  KTextTheme._();

  // light color theme

  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: tDarkColor,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: tDarkColor,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: tDarkColor,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
  );

  // dark color theme

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: tWhiteColor,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: tWhiteColor,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: tWhiteColor,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
  );
}
