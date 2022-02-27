import 'package:flutter/material.dart';
import 'package:pakplants/Screens/plantinfoforsale.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/buttons/buttonforsale.dart';

class Tielforsale extends StatefulWidget {
  var object;
  Tielforsale({required this.object});
  @override
  _TielforsaleState createState() => _TielforsaleState();
}

class _TielforsaleState extends State<Tielforsale> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Plantinfoforsale_screen(object: widget.object)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: height * 0.02),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.2,
              width: width * 0.97,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                border: Border.all(color: Color(0xff1c6434), width: 4),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0.0, 2)),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    top: height * 0.02,
                    left: width * 0.04,
                    child: Container(
                      height: height * 0.09,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(widget.object['images'][0]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  // Positioned(
                  //     top: height * 0.01,
                  //     left: width * 0.74,
                  //     child: Container(
                  //       child: Center(
                  //         child: Text(
                  //           'Active',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: height * 0.018),
                  //         ),
                  //       ),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: Colors.blue,
                  //       ),
                  //       height: height * 0.023,
                  //       width: width * 0.13,
                  //     )),
                  // Positioned(
                  //     top: height * 0.02,
                  //     left: width * 0.28,
                  //     child: Text('Rose Plant',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black,
                  //             fontSize: width * 0.07))),
                  Positioned(
                      top: height * 0.02,
                      left: width * 0.28,
                      child: Container(
                        width: width * 0.6,
                        height: height * 0.172,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.object['product_name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width * 0.07)),
                            SizedBox(height: height * 0.01),
                            Text(widget.object['description'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: width * 0.035)),
                            SizedBox(height: height * 0.01),
                            Text('Rs ' + widget.object['price'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: width * 0.06)),
                          ],
                        ),
                      )),

                  // Positioned(
                  //   top: height * 0.13,
                  //   left: width * 0.7,
                  //   child: Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       elevation: 2,
                  //       child: ButtonforSale(
                  //           text: 'Buy',
                  //           color: Color(0xff1c6434),
                  //           radius: 30,
                  //           enable: true,
                  //           onTap: () {
                  //             print('daba');
                  //           })),
                  // ),

                  // Positioned(
                  //     top: height * 0.004,
                  //     left: width * 0.82,
                  //     child: Container(
                  //       width: width * 0.13,
                  //       height: height * 0.05,
                  //       child: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.shopping_cart_rounded,
                  //             size: 35,
                  //             color: Color(0xff1c6434),
                  //           )),
                  //     ))

                  // Positioned(
                  //     top: height * 0.1,
                  //     left: width * 0.28,
                  //     child: Text('Pros and Cons',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.normal,
                  //             color: Colors.black,
                  //             fontSize: width * 0.035))),
                  // Positioned(
                  //   top: height * 0.13,
                  //   left: width * 0.27,
                  //   child: Container(
                  //     height: height * 0.025,
                  //     width: width * 0.06,
                  //     child: Icon(
                  //       Icons.calendar_today_rounded,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //     top: height * 0.138,
                  //     left: width * 0.34,
                  //     child: Text('23/07/2021',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.normal,
                  //             color: Colors.black,
                  //             fontSize: width * 0.035))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
