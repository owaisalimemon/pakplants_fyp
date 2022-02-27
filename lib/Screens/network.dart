import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pakplants/model/responsemodel.dart';

class NetworkService {
  Future<List> postimage(File file) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://15.207.18.64:8080/plant'));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final rs = await http.Response.fromStream(response);

      var result = jsonDecode(rs.body);
      print(result.toString());

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

    var request = http.MultipartRequest('POST',
        Uri.parse('https://plantation-area-detection.herokuapp.com/percent'));

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
