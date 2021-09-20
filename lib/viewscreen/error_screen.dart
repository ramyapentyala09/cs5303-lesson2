import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  ErrorScreen(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internal Error'),
        ),
        body: Text(
          'Internal error has occured\nRelaunch the app\n$errorMessage',
        style: TextStyle(color: Colors.red, fontSize: 24.0),
        ),
        );
  }
  
}