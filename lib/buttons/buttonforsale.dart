import 'package:flutter/material.dart';

class ButtonforSale extends StatelessWidget {
  String text;
  Color color;
  double radius;
  bool enable;
  Function()? onTap;
  ButtonforSale(
      {required this.text,
      required this.color,
      required this.radius,
      required this.enable,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: 80,
            height: 35,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xff1c6434),
              borderRadius: BorderRadius.circular(radius),
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
                    borderRadius: BorderRadius.circular(radius)),
                child: InkWell(
                    splashColor: Colors.black.withOpacity(0.2), onTap: onTap)),
          )
      ],
    );
  }
}
