import 'package:flutter/material.dart';

button134(String text, bool enable, TextStyle style, Function _callback) {
  return Stack(
    children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: style,
                textAlign: TextAlign.center,
              ),
            ],
          )),
      if (enable)
        Positioned.fill(
          child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              // shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(100) ),
              child: InkWell(
                splashColor: Colors.black.withOpacity(0.2),
                onTap: () {
                  _callback();
                }, // needed
              )),
        )
    ],
  );
}
