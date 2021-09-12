import 'package:flutter/material.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/collage.dart';
import 'package:pakplants/widgets/tileforsale.dart';

class Sale_Screen extends StatefulWidget {
  const Sale_Screen({Key? key}) : super(key: key);

  @override
  _Sale_ScreenState createState() => _Sale_ScreenState();
}

class _Sale_ScreenState extends State<Sale_Screen> {
  late double width, height;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c6434),
        title: Text(
          'Plants for Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Floatingcenterbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => Tielforsale()),
      ),
    );
  }
}
