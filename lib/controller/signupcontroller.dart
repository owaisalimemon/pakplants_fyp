import 'dart:io';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pakplants/Screens/home.dart';
import 'package:pakplants/helper/validation.dart';
import 'package:pakplants/widgets/snackbar.dart';

var getsignedup = ChangeNotifierProvider.autoDispose<SignupAuth>((ref) {
  return SignupAuth();
});

class SignupAuth extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController password2controleer = TextEditingController();

  Future emialsignuip(BuildContext context) async {
    if (emailcontroller.text.isEmpty) {
      SnackbarWidget().showsnackbar('Email is empty', context);
      return;
    }

    if (passwordcontroller.text.isEmpty) {
      SnackbarWidget().showsnackbar('Password is empty', context);
      return;
    }
    if (password2controleer.text.isEmpty) {
      SnackbarWidget().showsnackbar('Password2 is empty', context);
      return;
    }

    if (Validation().isEmail(emailcontroller.text) == false) {
      SnackbarWidget().showsnackbar('Email is not valid', context);
      return;
    }
    if (passwordcontroller.text != password2controleer.text) {
      SnackbarWidget().showsnackbar('Both Password are wrong', context);
      return;
    }

    print('done hogaya validate');
    ProgressDialog progressDialog = ProgressDialog(context,
        message: Text("Please Wait....."), title: Text("Loading"));
    progressDialog.show();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      progressDialog.dismiss();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home_Screen()),
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
