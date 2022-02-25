import 'package:flutter/material.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/textfield.dart';

import 'home.dart';
import 'login.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Container(
                    height: height,
                    width: width,
                    child: Image.asset("assets/images/background.png",
                        fit: BoxFit.fill)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.2),
              child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: width * 0.10,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff510b59)),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Textfiledfor(
                          text: 'Email address',
                          icon: Icons.person,
                          password: false,
                          controller: TextEditingController()),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      Textfiledfor(
                          text: 'Password',
                          icon: Icons.visibility_off,
                          password: true,
                          controller: TextEditingController()),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      Textfiledfor(
                          text: 'Re Enter Password',
                          icon: Icons.visibility_off,
                          password: true,
                          controller: TextEditingController()),

                      SizedBox(
                        height: height * 0.02,
                      ),

                      // SizedBox(
                      //   height: height * 0.01,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: width * 0.04),
                      //   child: Container(
                      //     child: button134(
                      //         "Forgot password ?",
                      //         true,
                      //         TextStyle(
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w800,
                      //             color: Colors.grey.shade700)),
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 2,
                          child: button2(
                              text: 'Sign Up',
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
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey.shade700),
                          ),
                          button134(
                              'Sign in',
                              true,
                              TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff510b59)), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Logins_screen()),
                            );
                          }),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
