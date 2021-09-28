import 'package:flutter/material.dart';

class MyUtil {
  static showSnackBar( {
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: (){},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
}