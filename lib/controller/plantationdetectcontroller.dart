import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var getmap =
    ChangeNotifierProvider.autoDispose<Plantationdetectcontroller>((ref) {
  return Plantationdetectcontroller();
});

class Plantationdetectcontroller extends ChangeNotifier {
  String? image;

  Future<String> uploadimage(File file) async {
    var path = file.path;

    Reference storageReference =
        FirebaseStorage.instance.ref().child("storage-bucket/$path");

    final UploadTask uploadTask = storageReference.putFile(File(
      path,
    ));
    final TaskSnapshot downloadUrl = (await uploadTask);

    final String url = await downloadUrl.ref.getDownloadURL();

    return url;
  }
}
