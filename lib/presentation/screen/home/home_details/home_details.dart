import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.navBarBackground,
        title: Text('Dora and the lost city of gold',style: AppStyle.titleAppbar,),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
