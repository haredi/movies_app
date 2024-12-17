import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/presentation/screen/home/tabs/browser_tab/browser_tab.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/view/home_tab.dart';
import 'package:movie_app/presentation/screen/home/tabs/search_tab/search_tab.dart';
import 'package:movie_app/presentation/screen/home/tabs/watchlist_tab/watchlist_tab.dart';

import '../../../core/utils/colors_manager.dart';

class Home extends StatefulWidget {
   Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
List<Widget>tabs=[
  HomeTab(),
  SearchTab(),
  BrowserTab(),
  WatchlistTab()
];
int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorsManager.scaffoldBg,
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: ColorsManager.navBarBackground
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex=index;
              });
            },
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon:  Icon(
                    Icons.home,
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'SEARCH',
                ),
                BottomNavigationBarItem(
                  icon:  ImageIcon(
                     AssetImage(AssetsManager.browserIcon),
                  ),
                  label: 'BROWSE',
                ),
                BottomNavigationBarItem(
                  icon:  ImageIcon(
                     AssetImage(AssetsManager.watchlistIcon),
                  ),
                  label: 'WATCHLIST',
                ),
              ]),
        ));
  }
}
