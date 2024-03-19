import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripadvisor/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    bottomAppBarTheme: bottomAppBar,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      tertiary: kTertiaryColor,
      error: kErrorColor,
    ),
  );
}
