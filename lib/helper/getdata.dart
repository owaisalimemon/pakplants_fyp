import 'package:flutter/services.dart';
import 'package:pakplants/model/datamodel.dart';

class DataController {
  static List<DataModel> datalist = [];

  static Future getdata() async {
    var data = await rootBundle.loadString('assets/' + "final.json");

    datalist = dataModelFromJson(data);
  }
}
