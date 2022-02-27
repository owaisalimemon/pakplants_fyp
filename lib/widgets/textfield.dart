import 'package:flutter/material.dart';

class Textfiledfor extends StatelessWidget {
  String text;
  IconData icon;
  bool password;
  TextEditingController controller;
  Textfiledfor(
      {required this.text,
      required this.icon,
      required this.password,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 2,
      child: TextFormField(
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: height * 0.025, horizontal: width * 0.05),
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          suffixIcon: IconButton(
            icon: Icon(icon),
            onPressed: () {},
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }
}
