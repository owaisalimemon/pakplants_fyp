import 'package:flutter/material.dart';

textfield(String text, IconData icon, double width, double height) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    elevation: 2,
    child: TextFormField(
      autocorrect: true,
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
