import 'package:flutter/material.dart';

import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions_admin/scr/constants/sizes.dart';

class KOutlinedButtonTheme {
  KOutlinedButtonTheme._();

  // light color theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: tSecondaryColor,
        side: BorderSide(color: tSecondaryColor),
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
  );

  // dark color theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
  );
}
