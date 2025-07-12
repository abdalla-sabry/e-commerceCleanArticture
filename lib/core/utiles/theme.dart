import 'package:flutter/material.dart';

import 'constant/colorConstante.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kLightPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: kBackgroundColor,
    cardColor: kLightSecondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kLightPrimaryColor,
      foregroundColor: kBackgroundColor,
      // elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: kLightSecondaryColor)),
    colorScheme: ColorScheme.light(secondary: kLightSecondaryColor)
        .copyWith(surface: kLightBackgroundColor),
  );
}
