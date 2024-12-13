import 'package:flutter/material.dart';

import '../../presentation/screen/home/home.dart';
import '../../presentation/screen/home/home_details/home_details.dart';
import '../../presentation/screen/splash/splash.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';
  static const String homeDetails='/homeDetails';
  static Route<MaterialPageRoute>?router(RouteSettings settings){
    switch(settings.name){
      case home:
        {
          return MaterialPageRoute(builder: (context)=>  Home());
        }
      case splash:
        {
          return MaterialPageRoute(builder: (context)=>const Splash());
        }
      case homeDetails:
        {
          return MaterialPageRoute(builder: (context)=>const HomeDetails());
        }

    }
  }
}