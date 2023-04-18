import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: PRIMARY_COLOR,
    scaffoldBackgroundColor: GREEN_BACKGROUND,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: PRIMARY_COLOR,
        onPrimary: WHITE_COLOR,
        secondary: GREEN_COLOR,
        onSecondary: WHITE_COLOR,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: GREEN_BACKGROUND,
        onBackground: BLACK_COLOR,
        surface: Colors.white,
        onSurface: BLACK_COLOR),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: WHITE_COLOR),
      backgroundColor: PRIMARY_COLOR,
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: WHITE_COLOR,
      unselectedItemColor: Colors.grey,
      selectedItemColor: PRIMARY_COLOR,
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    primaryColor: PRIMARY_DARK,
    scaffoldBackgroundColor: PRIMARY_DARK,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: PRIMARY_COLOR,
        onPrimary: PRIMARY_BLACK,
        secondary: PRIMARY_BLACK,
        onSecondary: PRIMARY_BLACK,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: PRIMARY_BLACK,
        onBackground: PRIMARY_COLOR,
        surface: PRIMARY_BLACK,
        onSurface: WHITE_COLOR),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: WHITE_COLOR),
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: PRIMARY_BLACK,
      unselectedItemColor: Colors.grey,
      selectedItemColor: PRIMARY_COLOR,
    ),
  );
}
