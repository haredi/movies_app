import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets_manager.dart';

class NewRelease extends StatefulWidget {
  NewRelease({super.key});

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
        ],
      ),
    );
  }
}