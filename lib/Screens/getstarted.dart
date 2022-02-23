import 'package:flutter/material.dart';
import 'package:pakplants/Screens/home.dart';
import 'package:pakplants/buttons/button2.dart';

class Getstarted_screen extends StatefulWidget {
  const Getstarted_screen({Key? key}) : super(key: key);

  @override
  _Getstarted_screenState createState() => _Getstarted_screenState();
}

class _Getstarted_screenState extends State<Getstarted_screen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  height: height,
                  width: width,
                  child:
                      Image.asset("assets/images/back.png", fit: BoxFit.fill)),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                      child: Container(
                          height: height * 0.2,
                          width: width * 0.4,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                            image: new AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                        height: height * 0.1,
                        width: width * 0.8,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          image: new AssetImage("assets/images/text.png"),
                          fit: BoxFit.fill,
                        ))),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.07),
                    child: Text(
                      'All Information About',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.07),
                    child: Text(
                      "Plants",
                      style: TextStyle(
                        color: Color(0xff1c6434),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.33,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 2,
                    child: button2(
                        text: 'GET STARTED',
                        color: Color(0xff1c6434),
                        radius: 30,
                        enable: true,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Screen()),
                          );
                        }),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
