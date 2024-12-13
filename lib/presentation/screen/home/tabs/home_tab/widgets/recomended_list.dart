import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/assets_manager.dart';

import '../../../../../../core/utils/colors_manager.dart';

class RecomendedList extends StatefulWidget {
  RecomendedList({super.key});

  @override
  State<RecomendedList> createState() => _RecomendedListState();
}

class _RecomendedListState extends State<RecomendedList> {
  bool isSaved=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.card,
      margin: REdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(4.r),
                  topLeft: Radius.circular(4.r)),
            ),
            child: Stack(
                children: [
                  Image.asset('assets/images/movie_img.png'),
                  InkWell(
                    onTap: () {
                      if (isSaved) {
                        isSaved = false;
                      } else {
                        isSaved = true;
                      }
                      setState(() {});
                    },
                    child: SvgPicture.asset(isSaved?AssetsManager.savedIcon:AssetsManager.plusIcon)
                  ),
                ]),
          ),
           Padding(
            padding:  REdgeInsets.symmetric(horizontal: 4,vertical: 8),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(Icons.star,size: 15,color: ColorsManager.yellow,),
                  Text('7.7',
                    style: AppStyle.rateOfItem)
                ],),
                Text('Deadpool 2',
                    style: AppStyle.largeTitleItem),
                Text('2018  R  1h 59m',
                    style: AppStyle.smallTitleItem),
              ],
            ),
          )
        ],
      ),
    );
  }
}