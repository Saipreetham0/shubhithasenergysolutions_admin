import 'package:flutter/material.dart';

import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions_admin/scr/constants/sizes.dart';

class KelevatedButtonTheme {
  KelevatedButtonTheme._();

  // light color theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        foregroundColor: tWhiteColor,
        backgroundColor: tSecondaryColor,
        textStyle: const TextStyle(
          color: tWhiteColor,
          // fontSize: 18,
          // fontWeight: FontWeight.w600,
        ),
        side: BorderSide(color: tSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
  );

  // dark color theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: const TextStyle(
          color: tDarkColor,
          // fontSize: 18,
          // fontWeight: FontWeight.w600,
        ),
        foregroundColor: tSecondaryColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
  );
}
