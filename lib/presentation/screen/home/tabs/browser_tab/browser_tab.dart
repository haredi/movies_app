import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/core/utils/colors_manager.dart';
import 'package:movie_app/presentation/screen/home/tabs/browser_tab/widget/browse_category.dart';

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Category ',
          style: AppStyle.titleAppbar,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BrowseCategory(),
    );
  }
}
