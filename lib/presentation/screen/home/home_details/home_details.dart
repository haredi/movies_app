import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/colors_manager.dart';
import 'package:movie_app/presentation/screen/home/home_details/widgets/header_details.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/recomended_list.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.card,
        title: Text(
          'Dora and the lost city of gold',
          style: AppStyle.titleAppbar,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(flex: 70,
            child: Container(
              child: HeaderDetails(),
            ),
          ),
      Text('More Like This',style: AppStyle.titleList,textAlign: TextAlign.start,),
      Expanded(
          flex: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 105.w,
                  height: 130.h,
                  child: RecomendedList(),
                );
              })),
          SizedBox(height: 18,),
        ],
      ),
    );
  }
}
