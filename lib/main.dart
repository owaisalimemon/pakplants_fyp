import 'package:flutter/material.dart';
import 'package:pakplants/Screens/cart.dart';
import 'package:pakplants/Screens/getstarted.dart';
import 'package:pakplants/Screens/home.dart';
import 'package:pakplants/Screens/identifiedplant.dart';
import 'package:pakplants/Screens/login.dart';
import 'package:pakplants/Screens/plantationdetection.dart';
import 'package:pakplants/Screens/plantationdetectionresult.dart';
import 'package:pakplants/Screens/plantinfo.dart';
import 'package:pakplants/Screens/plantinfoforsale.dart';
import 'package:pakplants/Screens/profile.dart';
import 'package:pakplants/Screens/sale.dart';
import 'package:pakplants/Screens/scanpic.dart';
import 'package:pakplants/Screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Getstarted_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
