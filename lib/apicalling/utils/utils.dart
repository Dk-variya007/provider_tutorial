import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static fieldFocusNode(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green,
        gravity: ToastGravity.BOTTOM_LEFT);
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
            message: message,
            forwardAnimationCurve: Curves.bounceIn,
            duration: Duration(seconds: 4),
            // flushbarPosition: FlushbarPosition.TOP,
            icon: Icon(
              Icons.error,
              size: 20,
              color: Colors.black,
            ),
            backgroundColor: Colors.red)
          ..show(context));
  }

  static snackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 4),
    ));
  }
}
