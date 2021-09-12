import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';

class Plantinfoforsale_screen extends StatefulWidget {
  const Plantinfoforsale_screen({Key? key}) : super(key: key);

  @override
  _Plantinfoforsale_screenState createState() =>
      _Plantinfoforsale_screenState();
}

class _Plantinfoforsale_screenState extends State<Plantinfoforsale_screen> {
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
                      isLoop: true,
                      children: [
                        Image.asset(
                          'assets/images/background.png',
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          'assets/images/back.png',
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                informationtext('Plant Name :', 'Rose '),
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
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Row(
                    children: [
                      button2("Add to Cart", Color(0xff1c6434), 30, true),
                      SizedBox(
                        width: width * 0.11,
                      ),
                      button2("Buy", Color(0xff1c6434), 30, true),
                    ],
                  ),
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
