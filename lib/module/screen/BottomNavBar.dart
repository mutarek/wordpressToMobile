import 'package:flutter/material.dart';
import 'package:wordpress_mobile/module/screen/add_post_page.dart';
import 'package:wordpress_mobile/module/screen/home_page.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

import 'hotelmotel_page.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex = 0;

  BottomNavBar(this.currentIndex, {Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    HomePage(),
    AddPostPage(),
    Container(),
    HotemotelPage(),
  ];

  void onTapTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[widget.currentIndex],
      backgroundColor: kHomeBgColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(46.0),
        child: Container(
          height: 64.0,
          margin: EdgeInsets.all(24.0),
          child: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: kBottomNavColor.withOpacity(0.08),
            selectedItemColor: kLightColor,
            unselectedItemColor: kLightColor.withOpacity(0.4),
            onTap: onTapTapped,
            currentIndex: widget.currentIndex,
            items: [
              buildBottomNavigationBarItem(0, "assets/icons/homeIcon.png", "Home"),
              buildBottomNavigationBarItem(1, "assets/icons/categoryIcon.png", "Category"),
              buildBottomNavigationBarItem(2, "assets/icons/searchIcon.png", "Search"),
              buildBottomNavigationBarItem(3, "assets/icons/profileIcon.jpg", "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(int index, String icon, String tooltip) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(icon),
          size: 20,
        ),
        label: tooltip);
  }
}
