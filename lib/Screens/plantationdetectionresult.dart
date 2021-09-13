import 'package:flutter/material.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

class PlantationResult extends StatefulWidget {
  @override
  _PlantationResultState createState() => _PlantationResultState();
}

class _PlantationResultState extends State<PlantationResult> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0xff1c6434),
          title: Text(
            'Plantation detection',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        // floatingActionButton: Floatingcenterbutton(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomNav(),
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
              padding: EdgeInsets.only(top: height * 0.14),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.45,
                      width: width * 0.8,
                      color: Colors.green,
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      "Plantation in selected",
                      style: TextStyle(
                          color: Color(0xff1c6434), fontSize: height * 0.04),
                    ),
                    SizedBox(height: height * 0.025),
                    Text(
                      "Area is",
                      style: TextStyle(
                          color: Color(0xff1c6434), fontSize: height * 0.04),
                    ),
                    SizedBox(height: height * 0.025),
                    Text(
                      "40%",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: height * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
