import 'package:flutter/material.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/tileforcart.dart';
import 'package:pakplants/widgets/tileforsale.dart';

import 'home.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);

  @override
  _Cart_screenState createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  late double width, height;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'PAKPLANTS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      // floatingActionButton: Floatingcenterbutton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNav(),
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
            children: [
              Center(
                child: Container(
                  width: width * 0.9,
                  height: height * 0.65,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff1c6434), width: 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.5,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Color(0xff1c6434), width: 4),
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) =>
                                  Tileforcart_screen()),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.1,
                          child: Row(
                            children: <Widget>[
                              button134(
                                  'Delete All',
                                  true,
                                  TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: width * 0.055,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red,
                                  ), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home_Screen()),
                                );
                              }),
                              SizedBox(
                                width: width * 0.2,
                              ),
                              Text('Total : Rs.6000/_',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: width * 0.055)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: button2(
                    text: "Checkout",
                    color: Color(0xff1c6434),
                    radius: 30,
                    enable: true,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_Screen()),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
