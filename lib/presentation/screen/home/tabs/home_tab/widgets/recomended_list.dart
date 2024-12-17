import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/domain/entities/toprate_entity.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../data/api_manager/end_points.dart';

class RecomendedList extends StatefulWidget {
  RecomendedList({super.key,required this.topRateItem});
TopRateEntity topRateItem;
  @override
  State<RecomendedList> createState() => _RecomendedListState();
}

class _RecomendedListState extends State<RecomendedList> {
  bool isSaved=false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105.w, height: 200.h,
      child: Container(
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
                    CachedNetworkImage(
                      imageUrl: '${EndPoints.imgBaseUrl}${widget.topRateItem.posterPath}',
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                    Text('${widget.topRateItem.voteAverage?.toStringAsFixed(1)}',
                      style: AppStyle.rateOfItem)
                  ],),
                  Text(widget.topRateItem.title??'',
                      style: AppStyle.largeTitleItem),
                  Text(widget.topRateItem.releaseDate??'',
                      style: AppStyle.smallTitleItem),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}