import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/colors_manager.dart';
import 'package:movie_app/presentation/screen/home/tabs/watchlist_tab/widget/watch_item.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 77.h,
        ),
        Text(
          'Watchlist',
          style: AppStyle.titleAppbar,
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: ListView.separated(
            itemCount: 50,
            itemBuilder: (context, index) {
              return WatchItem();
            },
            separatorBuilder: (context, index) {
              return Divider(
                endIndent: 30,
                indent: 20,
                color: ColorsManager.divider,
              );
            },
          ),
        ),
      ],
    );
  }
}
