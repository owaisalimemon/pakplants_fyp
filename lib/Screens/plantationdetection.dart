import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pakplants/Screens/network.dart';
import 'package:pakplants/Screens/networkforplantation.dart';
import 'package:pakplants/Screens/plantationdetectionresult.dart';
import 'package:pakplants/buttons/button134.dart';
import 'package:pakplants/buttons/button2.dart';
import 'package:pakplants/buttons/buttonforsale.dart';
import 'package:pakplants/controller/plantationdetectcontroller.dart';
import 'package:pakplants/widgets/bottomnavigationbar.dart';
import 'package:pakplants/widgets/centerfloating.dart';
import 'package:pakplants/widgets/googlemaps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home.dart';

class PlantationDetection extends ConsumerWidget {
  gallery(BuildContext context, Plantationdetectcontroller controller) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      controller.image = image.path;
      controller.notifyListeners();
      ProgressDialog progressDialog = ProgressDialog(context,
          message: Text("Please Wait....."), title: Text("Loading"));
      progressDialog.show();
      try {
        var result = await NetworkService().wajid(File(image.path));
        controller.notifyListeners();
        progressDialog.dismiss();
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlantationResult(
            controller: controller,
            result: result,
          );
        }));
      } catch (e) {
        progressDialog.dismiss();
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Result:'),
              content: Text(
                e.toString(),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  GoogleMapController? ctr;
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getmap);
    ProgressDialog progressDialog = ProgressDialog(context,
        message: Text("Please Wait....."), title: Text("Loading"));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                onMapCreated: (c) {
                  _controller.complete(c);
                  ctr = c;
                  controller.notifyListeners();
                },
                myLocationEnabled: true,
                mapType: MapType.satellite,
                initialCameraPosition:
                    CameraPosition(target: LatLng(23.5880, 58.3829), zoom: 20),
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
                      callback: () async {
                        await gallery(context, controller);
                      }))

              //button134("Check Plantation", true, )
            ],
          ),
        ));
  }
}
