import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pakplants/model/responsemodel.dart';

class NetworkService {
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

  Future wajid(File file) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://fyp-2-area.herokuapp.com/percent'));

    print(file.path);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final rs = await http.Response.fromStream(response);

      print(rs.body);
      var result = jsonDecode(rs.body);

      return result;
    } else {
      throw (response.reasonPhrase!);
    }
  }
}
