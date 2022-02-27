import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pakplants/Screens/signup.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/controller/signincontroller.dart';
import 'package:pakplants/widgets/textfield.dart';

import 'home.dart';

class Logins_screen extends ConsumerWidget {
  String price;
  Logins_screen({required this.price});

  late double width, height;
  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsignedin);
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
                          'SIGN IN',
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
                          controller: controller.emailcontroller),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Textfiledfor(
                          text: 'Password',
                          icon: Icons.visibility_off,
                          password: true,
                          controller: controller.passwordcontroller),
                      SizedBox(
                        height: height * 0.01,
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
                          child: button2(
                              text: 'Sign In',
                              color: Color(0xff1c6434),
                              radius: 30,
                              enable: true,
                              callback: () {
                                controller.emialsignin(context, price);
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
      ),
    );
  }
}
