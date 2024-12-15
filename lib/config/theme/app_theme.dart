import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class AppTheme {
  static final ThemeData light=ThemeData(
    scaffoldBackgroundColor: ColorsManager.scaffoldBg,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppStyle.headerSmallText,
      backgroundColor: ColorsManager.navBarBackground,
      elevation: 20,
      unselectedItemColor: ColorsManager.bottomNav,
      selectedItemColor: ColorsManager.yellow,
      showSelectedLabels: true,
      showUnselectedLabels: true,


    ),
  );
}