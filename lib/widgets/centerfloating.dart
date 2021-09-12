import 'package:flutter/material.dart';

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
      onPressed: () {},
      child: Icon(
        Icons.camera_alt,
        size: 50,
        color: Color(0xff1c6434),
      ),
    );
  }
}
