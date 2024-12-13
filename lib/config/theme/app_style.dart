import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/colors_manager.dart';

class AppStyle{
  static TextStyle headerLargeText=GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp,color: ColorsManager.white,);
  static TextStyle headerSmallText=GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 10.sp,color: ColorsManager.smallTitle,);
  static TextStyle rateOfItem=GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 10.sp,color: ColorsManager.white,);
  static TextStyle smallTitleItem=GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 8.sp,color: ColorsManager.smallTitle,);
  static TextStyle largeTitleItem=GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 10.sp,color: ColorsManager.white,);
  static TextStyle titleList=GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 15.sp,color: ColorsManager.white);
  static TextStyle titleAppbar=GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 20.sp,color: ColorsManager.white);

}