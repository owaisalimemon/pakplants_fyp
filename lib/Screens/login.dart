import 'package:flutter/material.dart';
import 'package:pakplants/Screens/signup.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/textfield.dart';

import 'home.dart';

class Logins_screen extends StatefulWidget {
  const Logins_screen({Key? key}) : super(key: key);

  @override
  _Logins_screenState createState() => _Logins_screenState();
}

class _Logins_screenState extends State<Logins_screen> {
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
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: width * 0.10,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff510b59)),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    textfield("Email address", Icons.person, width, height),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    textfield("Password", Icons.visibility_off, width, height),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: Container(
                        child: button134(
                            "Forgot password ?",
                            true,
                            TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey.shade700), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Logins_screen()),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 2,
                        child:
                            button2('Sign In', Color(0xff1c6434), 30, true, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Screen()),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.shade700),
                        ),
                        button134(
                            'Sign up',
                            true,
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff510b59),
                            ), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Signup_Screen()),
                          );
                        }),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
