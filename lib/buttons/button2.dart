import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
  String text;
  Color color;
  double radius;
  bool enable;
  Function callback;
  button2(
      {required this.enable,
      required this.callback,
      required this.radius,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: 155,
            height: 60,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: (enable) ? color : Colors.grey.withOpacity(0),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 19,
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
                    borderRadius: BorderRadius.circular(radius)),
                child: InkWell(
                  splashColor: Colors.black.withOpacity(0.2),
                  onTap: () {
                    callback();
                  }, // needed
                )),
          )
      ],
    );
  }
}
