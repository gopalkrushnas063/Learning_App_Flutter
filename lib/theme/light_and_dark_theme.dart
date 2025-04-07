import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey.shade100,
    background: Colors.white,
    primary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
  ),
  useMaterial3: true,
);

// final ThemeData darkTheme = ThemeData(
//   fontFamily: AppFontFamily.UberMoveMedium,
//   primaryColor: AppColors.white,
//   scaffoldBackgroundColor: AppColors.black,
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: AppColors.grey80,
//     background: AppColors.black,
//     primary: AppColors.white,
//     onBackground: AppColors.white,
//     onSurface: AppColors.white,
//   ),
//   useMaterial3: true,
// );

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey.shade100,
    background: Colors.black,
    primary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
  ),
  useMaterial3: true,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.grey.shade100.withOpacity(0.5),
    selectionHandleColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.black,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);
