import 'package:flutter/material.dart';
import 'package:scouting6647/screens/app_pages/addpagemanager.dart';
import 'package:scouting6647/screens/robot_gallery/robot_list.dart';
import 'package:scouting6647/screens/settings/settings_screen.dart';

import 'custombottomnavybar.dart';

class BottomBarInterface extends StatefulWidget {
  const BottomBarInterface();

  @override
  State<BottomBarInterface> createState() => _BottomBarInterfaceState();
}

class _BottomBarInterfaceState extends State<BottomBarInterface> {
  int _currentIndex = 0;
  late final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Scaffold(
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                AddPageManager(),
                ListGallery(),
                SettingScreen(),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavyBar(
            backgroundColor: Color(0xff151515),
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: <CustomBottomNavyBarItem>[
              CustomBottomNavyBarItem(
                title: const Text(
                  'Home',
                  style: TextStyle(fontFamily: "Manrope"),
                ),
                icon: const Icon(Icons.home),
                activeColor: Colors.lightBlue,
              ),
              CustomBottomNavyBarItem(
                title: const Text(
                  'Robots',
                  style: TextStyle(fontFamily: "Manrope"),
                ),
                icon: const Icon(Icons.apps),
                activeColor: Colors.lightBlue,
              ),
              CustomBottomNavyBarItem(
                title: const Text(
                  'Settings',
                  style: TextStyle(fontFamily: "Manrope"),
                ),
                icon: const Icon(Icons.settings),
                activeColor: Colors.lightBlue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
