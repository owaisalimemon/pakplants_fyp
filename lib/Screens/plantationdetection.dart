import 'package:flutter/material.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/buttons/buttonforsale.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/googlemaps.dart';

class PlantationDetection extends StatefulWidget {
  @override
  _PlantationDetectionState createState() => _PlantationDetectionState();
}

class _PlantationDetectionState extends State<PlantationDetection> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Plantation Detection',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.06),
          ),
          centerTitle: true,
        ),
        floatingActionButton: Floatingcenterbutton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNav(),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.45,
                      width: width * 0.8,
                      color: Colors.green,
                    ),
                    SizedBox(height: height * 0.05),
                    //buttonforsale("Check Plantation", Color(0xff1c6434), 30, true)
                    button2("Check Plantation", Color(0xff1c6434), 30, true),
                    //button134("Check Plantation", true, )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
