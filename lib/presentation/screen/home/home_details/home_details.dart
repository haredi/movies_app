import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/colors_manager.dart';
import 'package:movie_app/domain/entities/popular_entity.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {

    PopularEntity popular=ModalRoute.of(context)?.settings.arguments as PopularEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.navBarBackground,
        title: Text(popular.title??'',style: AppStyle.titleAppbar,),
        centerTitle: true,
      ),
      body: Container(
      color: Colors.blueGrey,
        ),

    );
  }
}
