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
  camera(BuildContext context, Plantationdetectcontroller controller) async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 85);

    if (image == null) {
      return;
    } else {
      controller.image = image.path;
      controller.notifyListeners();
    }
  }

  gallery(BuildContext context, Plantationdetectcontroller controller) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      controller.image = image.path;
      controller.notifyListeners();
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
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    controller.image == '' || controller.image == null
                        ? Center(
                            child: Container(
                              width: width * 0.8,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/background.png',
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        : Center(
                            child: Container(
                              width: width * 0.8,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: FileImage(File(controller.image!)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Row(
                        children: [
                          button2(
                              text: "From Camera",
                              color: Color(0xff1c6434),
                              radius: 30,
                              enable: true,
                              callback: () {
                                camera(context, controller);
                              }),
                          SizedBox(
                            width: width * 0.11,
                          ),
                          button2(
                              text: "From Gallery",
                              color: Color(0xff1c6434),
                              radius: 30,
                              enable: true,
                              callback: () {
                                gallery(context, controller);
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Center(
                      child: Container(
                        child: button2(
                            text: "Identify",
                            color: Color(0xff1c6434),
                            radius: 30,
                            enable: true,
                            callback: () async {
                              ProgressDialog progressDialog = ProgressDialog(
                                  context,
                                  message: Text("Please Wait....."),
                                  title: Text("Loading"));
                              progressDialog.show();
                              try {
                                var result = await NetworkService()
                                    .wajid(File(controller.image.toString()));
                                controller.notifyListeners();
                                progressDialog.dismiss();
                                await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
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
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
