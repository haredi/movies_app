import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/routes_manager.dart';

import '../../../../../../config/theme/app_style.dart';
import '../../../../../../core/utils/colors_manager.dart';

class HeaderItem extends StatefulWidget {
  HeaderItem({super.key});
  @override
  State<HeaderItem> createState() => _HeaderItemState();
}
class _HeaderItemState extends State<HeaderItem> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: .9,
        height: 390.h,
        autoPlay: true,
        aspectRatio:16/9 ,
        autoPlayAnimationDuration: Duration(seconds: 2)
      ),
      itemCount: 10,
      itemBuilder:(context, index, realIndex) {
        return  Stack(

           alignment: Alignment.bottomLeft,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Expanded(
                   flex: 3,
                   child: InkWell(
                     onTap: () {
                       Navigator.pushNamed(context, RoutesManager.homeDetails);
                     },
                     child: Image.asset(
                       'assets/images/movie_img.png',
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 Expanded(
                     flex: 1,
                     child: Container(color: ColorsManager.scaffoldBg,))
               ],
             ),
             Positioned(
               bottom: 10,
               left: 21,
               right: 225,
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
                     child: SvgPicture.asset(
                       isSaved ? AssetsManager.savedIcon : AssetsManager.plusIcon,
                     ),
                   ),
                 ],
               ),
             ),
             Positioned(
               top: 220,
               left: 164,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Dora and the lost city of gold',
                     style: AppStyle.headerLargeText,
                   ),
                   SizedBox(
                     height: 7.h,
                   ),
                   Text(
                     '2019  PG-13  2h 7m',
                     style: AppStyle.headerSmallText,
                   )
                 ],
               ),
             ),
           ],
         );
      },

    );
  }
}
