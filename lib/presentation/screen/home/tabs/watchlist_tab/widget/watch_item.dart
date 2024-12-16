import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/assets_manager.dart';

class WatchItem extends StatefulWidget {
  const WatchItem({super.key});
  @override
  State<WatchItem> createState() => _WatchItemState();
}
class _WatchItemState extends State<WatchItem> {
  // bool isSaved=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 29,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/watch_img.png',width: 140,height: 90,),
              InkWell(
                onTap: () {
                },
                child: SvgPicture.asset(
                 AssetsManager.savedIcon ,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Alita Battle Angel',style: AppStyle.titleList,),
                SizedBox(height: 5,),
                Text('2019',style: AppStyle.textDetails,),
                SizedBox(height: 5,),
                Text('Rosa Salazar, Christoph Waltz',style: AppStyle.textDetails),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
