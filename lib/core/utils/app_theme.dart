import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme =
  ThemeData(

    scaffoldBackgroundColor:
    AppColors.black,

    appBarTheme: const AppBarTheme(
      backgroundColor:
      AppColors.black,
    ),

    inputDecorationTheme:
    InputDecorationTheme(

      filled: true,

      fillColor:
      AppColors.textFieldColor,

      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),
    ),
  );
}