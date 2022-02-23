import 'package:flutter/material.dart';
import 'package:pakplants/Screens/plantationdetectionresult.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/buttons/buttonforsale.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/googlemaps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home.dart';

class PlantationDetection extends StatefulWidget {
  @override
  _PlantationDetectionState createState() => _PlantationDetectionState();
}

class _PlantationDetectionState extends State<PlantationDetection> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,

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
          child: Stack(
            children: <Widget>[
              GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.satellite,
                initialCameraPosition:
                    CameraPosition(target: LatLng(23.5880, 58.3829), zoom: 18),
                minMaxZoomPreference: MinMaxZoomPreference(17.5, 22),
              ),
              SizedBox(height: height * 0.05),
              //buttonforsale("Check Plantation", Color(0xff1c6434), 30, true)
              Positioned(
                  top: height * 0.8,
                  left: width * 0.3,
                  child: button2(
                      text: "Check Plantation",
                      color: Color(0xff1c6434),
                      radius: 30,
                      enable: true,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlantationResult()),
                        );
                      }))

              //button134("Check Plantation", true, )
            ],
          ),
        ));
  }
}
