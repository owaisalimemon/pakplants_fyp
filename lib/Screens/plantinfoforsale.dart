import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pakplants/Screens/cart.dart';
import 'package:pakplants/Screens/login.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

import 'home.dart';

class Plantinfoforsale_screen extends StatefulWidget {
  var object;

  Plantinfoforsale_screen({required this.object});

  @override
  _Plantinfoforsale_screenState createState() =>
      _Plantinfoforsale_screenState();
}

class _Plantinfoforsale_screenState extends State<Plantinfoforsale_screen> {
  List<Widget> images = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.object['images'].length; i++) {
      images.add(
        Image.network(
          widget.object['images'][i],
          fit: BoxFit.fill,
        ),
      );
    }
    setState(() {});
  }

  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'PAKPLANTS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      // floatingActionButton: Floatingcenterbutton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: width * 1,
                    height: height * 0.3,
                    child: ImageSlideshow(
                        width: double.infinity,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          debugPrint('Page changed: $value');
                        },
                        autoPlayInterval: 3000,
                        isLoop: false,
                        children: images),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: Text('Rs ' + widget.object['price'].toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                informationtext('Plant Name :', widget.object['product_name']),
                SizedBox(
                  height: height * 0.05,
                ),
                informationtext('Plant info :', widget.object['description']),
                SizedBox(
                  height: height * 0.05,
                ),
                informationtext('Pros & Cons :', widget.object['prosandcons']),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: button2(
                      text: "Buy",
                      color: Color(0xff1c6434),
                      radius: 30,
                      enable: true,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Logins_screen()),
                        );
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Widget informationtext(String heading, String text) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.32,
            child: Text(
              heading,
              style: TextStyle(
                  fontSize: height * 0.025, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: width * 0.005,
          ),
          Container(
            width: width * 0.58,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: height * 0.025, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
