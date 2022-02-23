import 'package:cloud_firestore/cloud_firestore.dart';
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
          'Plant For Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      // floatingActionButton: Floatingcenterbutton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNav(),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Tielforsale(
                          object: snapshot.data!.docs[index],
                        ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
