import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  final String inputtext;
  const Appbar({Key? key, required this.inputtext}) : super(key: key);

  @required
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: Color(0xff1c6434),
      title: Text(
        widget.inputtext,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08),
      ),
      centerTitle: true,
    );
  }
}
