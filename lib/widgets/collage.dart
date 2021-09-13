import 'package:flutter/material.dart';
import 'package:pakplants/Screens/plantinfo.dart';

class Collagehome extends StatefulWidget {
  const Collagehome({Key? key}) : super(key: key);

  @override
  _CollagehomeState createState() => _CollagehomeState();
}

class _CollagehomeState extends State<Collagehome> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Plantinfo_Screen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: height * 0.03),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.2,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.purple[50],
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
                              image: AssetImage('assets/images/back.png'),
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
                            Text('Rose Plant',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width * 0.07)),
                            SizedBox(height: height * 0.01),
                            Text(
                                'rose,genus of some 100 species of perennial shrubs in the rose family (Rosaceae). ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: width * 0.035)),
                            SizedBox(height: height * 0.01),
                            Text('Pros and Cons',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: width * 0.035))
                          ],
                        ),
                      )),
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
