import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/data/model/results.dart';

import '../../../../../../config/theme/app_style.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../data/api_manager/end_points.dart';
import '../../../../../../domain/entities/popular_entity.dart';

class PopularItem extends StatefulWidget {
  PopularItem({super.key,required this.popularList});
List<PopularEntity> popularList;

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: .9,
        height: 300.h,
        autoPlay: true,
        aspectRatio:16/9 ,
        autoPlayAnimationDuration: Duration(seconds: 1)
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
                       Navigator.pushNamed(context, RoutesManager.homeDetails,arguments: widget.popularList[index]);

                     },
                     child:
                     CachedNetworkImage(
                       fit: BoxFit.fill,
                       imageUrl: '${EndPoints.imgBaseUrl}${widget.popularList[index].backdropPath}'??'',
                       placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                       errorWidget: (context, url, error) => Icon(Icons.error),
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
                   CachedNetworkImage(
                     imageUrl: '${EndPoints.imgBaseUrl}${widget.popularList[index].posterPath}'??'https://images.app.goo.gl/eX4NLkmi7tD4gAHQA',
                     placeholder: (context, url) => CircularProgressIndicator(),
                     errorWidget: (context, url, error) => Icon(Icons.error),
                   ),
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
                     widget.popularList[index].title??'',
                     style: AppStyle.headerLargeText,
                   ),
                   SizedBox(
                     height: 7.h,
                   ),
                   Text(
                     widget.popularList[index].releaseDate??"",
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
