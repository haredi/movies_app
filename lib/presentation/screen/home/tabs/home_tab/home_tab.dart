import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/header_item.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/new_releases_list.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/recomended_list.dart';
import '../../../../../core/utils/colors_manager.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 300.h,
            child: HeaderItem()),
        SizedBox(height: 10.h),
        Container(
          height: 195.h,
          padding: REdgeInsets.symmetric(vertical: 12),
          color: ColorsManager.container,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'New Releases ',
                  style: AppStyle.titleList
                ),
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 130.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NewRelease();
                    }),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 270.h,
          padding: REdgeInsets.symmetric(vertical: 10),
          color: ColorsManager.container,
          child:    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  REdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Recomended ',
                    style: AppStyle.titleList
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 105.w,
                            height: 210.h,
                            child: RecomendedList());
                      }),
                ),
              ]),
        ),
        SizedBox(height: 5.h),

      ],
    );
  }
}
