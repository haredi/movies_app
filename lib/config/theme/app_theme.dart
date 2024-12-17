import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class AppTheme {
  static final ThemeData light=ThemeData(
    scaffoldBackgroundColor: ColorsManager.scaffoldBg,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.navBarBackground,
      elevation: 20,
      unselectedItemColor: ColorsManager.bottomNav,
      selectedItemColor: ColorsManager.yellow,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(size: 35 ),
      // unselectedIconTheme: const IconThemeData(size: 30)
    )
  );
}