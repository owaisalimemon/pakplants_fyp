import 'package:flutter/material.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_sharp,
            size: height * 0.05,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.07,
              color: Colors.black),
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
            padding: EdgeInsets.only(top: height * 0.136),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/prof.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.08,
                      ),
                      Text("Peter Parker",
                          style: TextStyle(
                            fontSize: height * 0.03,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.12,
                        ),
                        child: Icon(
                          Icons.email_rounded,
                          size: height * 0.08,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.14,
                      ),
                      Text("abc@yahoo.com",
                          style: TextStyle(
                            fontSize: height * 0.03,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.12,
                        ),
                        child: Icon(
                          Icons.phone_android,
                          size: height * 0.08,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.14,
                      ),
                      Text("0123456789",
                          style: TextStyle(
                            fontSize: height * 0.03,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.12,
                        ),
                        child: Icon(
                          Icons.info_outline_rounded,
                          size: height * 0.08,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.14,
                      ),
                      Text("Information",
                          style: TextStyle(
                            fontSize: height * 0.03,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.12,
                        ),
                        child: Icon(
                          Icons.logout_outlined,
                          size: height * 0.08,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.14,
                      ),
                      Text("Logout",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: height * 0.03,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
