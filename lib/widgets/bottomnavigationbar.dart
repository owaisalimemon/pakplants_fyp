import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final iconList = <IconData>[
    Icons.home,
    Icons.map,
    Icons.shopping_bag_outlined,
    Icons.person
  ];
  final text_list = <String>[
    "Home",
    "Plantation",
    "Shop",
    "Profile",
  ];

  late int _bottomNavIndex = 4;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      elevation: 0,
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                text_list[index],
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
      backgroundColor: Color(0xff1c6434),
      activeIndex: _bottomNavIndex,
      splashColor: Colors.red,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 0,
      rightCornerRadius: 0,
      onTap: (index) => setState(() => _bottomNavIndex = index),
    );
  }
}
