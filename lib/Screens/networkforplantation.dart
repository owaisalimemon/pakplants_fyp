import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pakplants/model/responsemodel.dart';

class NetworkServiceForPlantation {
  Future postimage(File file) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://my-api.plantnet.org/v2/identify/all?api-key=2b10Dc5WMt8i4qW9RM03Q2MAu'));
    request.files.add(await http.MultipartFile.fromPath('images', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final rs = await http.Response.fromStream(response);
      ResponseModel result = responseModelFromJson(rs.body);

      return result;
    } else {
      throw (response.reasonPhrase!);
    }
  }
}
