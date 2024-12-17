import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/data/api_manager/end_points.dart';
import 'package:movie_app/domain/entities/upcoming_entity.dart';

class NewRelease extends StatefulWidget {
  NewRelease({super.key, required this.upcomingEntity});
  UpcomingEntity upcomingEntity;

  @override
  State<NewRelease> createState() => _NewReleaseState();
}

class _NewReleaseState extends State<NewRelease> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: '${EndPoints.imgBaseUrl}${widget.upcomingEntity.posterPath}',
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
        ],
      ),
    );
  }
}