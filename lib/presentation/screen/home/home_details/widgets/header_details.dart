import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class HeaderDetails extends StatefulWidget {
  const HeaderDetails({super.key});

  @override
  State<HeaderDetails> createState() => _HeaderDetailsState();
}

class _HeaderDetailsState extends State<HeaderDetails> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/movie_image1.png',
          width: double.infinity,
          height: 217.h,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dora and the lost city of gold',
                style: AppStyle.titleAppbar.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '2019  PG-13  2h 7m',
                style: AppStyle.headerSmallText.copyWith(fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/movie_img.png',
                        width: 130.w,
                        height: 200.h,
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
                          isSaved
                              ? AssetsManager.savedIcon
                              : AssetsManager.plusIcon,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 50.w,
                                height: 30.h,
                                child: Text(
                                  'Action',
                                  style: AppStyle.headerSmallText
                                      .copyWith(fontSize: 12),
                                  textAlign: TextAlign.start,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsManager.card,
                                      width: 2.w,
                                    ),
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle)),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                                width: 50.w,
                                height: 30.h,
                                child: Text(
                                  'Action',
                                  style: AppStyle.headerSmallText
                                      .copyWith(fontSize: 12),
                                  textAlign: TextAlign.start,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsManager.card,
                                      width: 2.w,
                                    ),
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle)),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                                width: 50.w,
                                height: 30.h,
                                child: Text(
                                  'Action',
                                  style: AppStyle.headerSmallText
                                      .copyWith(fontSize: 12),
                                  textAlign: TextAlign.start,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsManager.card,
                                      width: 2.w,
                                    ),
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle)),
                            SizedBox(width: 7),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 50.w,
                            height: 30.h,
                            child: Text(
                              'Action',
                              style: AppStyle.headerSmallText
                                  .copyWith(fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorsManager.card,
                                  width: 2.w,
                                ),
                                color: Colors.transparent,
                                shape: BoxShape.rectangle)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Having spent most of her life\nexploring the jungle, nothing could\n prepare Dora for her most dangerous\n adventure yet — high school. ',
                              style: AppStyle.textDetails,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size:20,
                                  color: ColorsManager.yellow,
                                ),
                                SizedBox(width: 7.w,),
                                Text('7.7', style: AppStyle.rateOfItem.copyWith(fontSize: 18))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
