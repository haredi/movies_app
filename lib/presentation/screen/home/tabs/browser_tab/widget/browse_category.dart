import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/theme/app_style.dart';

class BrowseCategory extends StatelessWidget {
  const BrowseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing:20.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 120,

        ),
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/browse_img.png',
                width: 170.w,
                height: 100.h,
              ),
              Text(
                'Action',
                style: AppStyle.headerLargeText
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          );
        });
  }
}
