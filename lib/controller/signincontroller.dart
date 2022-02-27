import 'dart:io';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pakplants/Screens/cart.dart';
import 'package:pakplants/Screens/home.dart';
import 'package:pakplants/helper/validation.dart';
import 'package:pakplants/widgets/snackbar.dart';

var getsignedin = ChangeNotifierProvider.autoDispose<SigninAuth>((ref) {
  return SigninAuth();
});

class SigninAuth extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future emialsignin(BuildContext context, String price) async {
    if (emailcontroller.text.isEmpty) {
      SnackbarWidget().showsnackbar('Email is empty', context);
      return;
    }

    if (passwordcontroller.text.isEmpty) {
      SnackbarWidget().showsnackbar('Password is empty', context);
      return;
    }

    if (Validation().isEmail(emailcontroller.text) == false) {
      SnackbarWidget().showsnackbar('Email is not valid', context);
      return;
    }

    print('done hogaya validate');
    ProgressDialog progressDialog = ProgressDialog(context,
        message: Text("Please Wait....."), title: Text("Loading"));
    progressDialog.show();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

      progressDialog.dismiss();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Cart_screen(
                  price: price,
                )),
      );
    } catch (error) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Result:'),
            content: Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  progressDialog.dismiss();
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
