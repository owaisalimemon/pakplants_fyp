import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

class IndefiedPlant_Screen extends StatefulWidget {
  const IndefiedPlant_Screen({Key? key}) : super(key: key);

  @override
  _IndefiedPlant_ScreenState createState() => _IndefiedPlant_ScreenState();
}

class _IndefiedPlant_ScreenState extends State<IndefiedPlant_Screen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Floatingcenterbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Container(
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
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.35,
                    color: Colors.blue,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.32,
                        child: Text(
                          "Plant Name :",
                          style: TextStyle(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.005,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 4)),
                        width: width * 0.58,
                        child: Text(
                          'Rose',
                          style: TextStyle(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                informationtext('Plant info :',
                    'rose,genus of some 100 species of perennial shrubs in the rose family (Rosaceae).'),
                SizedBox(
                  height: height * 0.05,
                ),
                informationtext('Pros & Cons :',
                    'Pros Clear, bright colors; may bloom all year in warm climates; disease resistant. Cons May lack scent; the nonstop flowers can become boring; some gardeners find them too common and ordinary.'),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: height * 0.03, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                    child: Container(
                  width: width * 0.95,
                  height: height * 0.6,
                  // color: Colors.amber,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.green,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.02),
                        width: width * 0.3,
                        height: height * 0.8,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ))
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
