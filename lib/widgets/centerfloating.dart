import 'package:flutter/material.dart';
import 'package:pakplants/Screens/scanpic.dart';

class Floatingcenterbutton extends StatefulWidget {
  const Floatingcenterbutton({Key? key}) : super(key: key);

  @override
  _FloatingcenterbuttonState createState() => _FloatingcenterbuttonState();
}

class _FloatingcenterbuttonState extends State<Floatingcenterbutton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Scanpic_screen()),
        );
      },
      child: Icon(
        Icons.camera_alt,
        size: 50,
        color: Color(0xff1c6434),
      ),
    );
  }
}
