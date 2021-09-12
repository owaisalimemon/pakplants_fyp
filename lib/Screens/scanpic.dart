import 'package:flutter/material.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

class Scanpic_screen extends StatefulWidget {
  const Scanpic_screen({Key? key}) : super(key: key);

  @override
  _Scanpic_screenState createState() => _Scanpic_screenState();
}

class _Scanpic_screenState extends State<Scanpic_screen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'Select Picture',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Floatingcenterbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(),
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.35,
                    color: Colors.blue,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Row(
                    children: [
                      button2("Capture Again", Color(0xff1c6434), 30, true),
                      SizedBox(
                        width: width * 0.11,
                      ),
                      button2("From Gallery", Color(0xff1c6434), 30, true),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Center(
                  child: Container(
                    child: button2("Identify", Color(0xff1c6434), 30, true),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
