import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:pakplants/Screens/plantationdetection.dart';
import 'package:pakplants/Screens/profile.dart';
import 'package:pakplants/Screens/sale.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/appbar.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/collage.dart';
import 'package:pakplants/widgets/textfield.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  double width = 0, height = 0;
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

  List screens = [
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'PAKPLANTS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => Collagehome()),
    ),
    PlantationDetection(),
    Sale_Screen(),
    Profile(),
  ];
  int _bottomNavIndex = 0;
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff1c6434),
      //   title: Text(
      //     'PAKPLANTS',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08),
      //   ),
      //   centerTitle: true,
      // ),
      floatingActionButton: Floatingcenterbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
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
      ),
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: IndexedStack(
            index: _bottomNavIndex,
            children: [
              Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color(0xff1c6434),
                  title: Text(
                    'PAKPLANTS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  centerTitle: true,
                ),
                body: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) =>
                        Collagehome()),
              ),
              PlantationDetection(),
              Sale_Screen(),
              Profile(),
            ],
          )),
    );
  }
}
