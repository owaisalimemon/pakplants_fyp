import 'package:flutter/material.dart';

buttonforsale(String text, Color color, double _radius, bool enable) {
  return Stack(
    children: <Widget>[
      Container(
          width: 80,
          height: 35,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: (enable) ? color : Colors.grey.withOpacity(0),
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          )),
      if (enable)
        Positioned.fill(
          child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius)),
              child: InkWell(
                splashColor: Colors.black.withOpacity(0.2),
                onTap: () {
                  // _callback();
                }, // needed
              )),
        )
    ],
  );
}
